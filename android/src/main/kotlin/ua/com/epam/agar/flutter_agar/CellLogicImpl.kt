package ua.com.epam.agar.flutter_agar


import android.util.Log
import com.google.gson.Gson
import io.flutter.plugin.common.MethodChannel
import ua.com.epam.agar.hackathon.core.entity.cell.property.CellActivity
import ua.com.epam.agar.hackathon.core.entity.cell.property.CellId
import ua.com.epam.agar.hackathon.core.entity.cell.property.MoveAction
import ua.com.epam.agar.hackathon.core.entity.main.DesiredCellsState
import ua.com.epam.agar.hackathon.core.entity.main.MapState
import ua.com.epam.agar.hackathon.core.entity.public_api.CellLogic

@Suppress("UNCHECKED_CAST")
class CellLogicImpl(private val methodChannel: MethodChannel) : CellLogic() {

    private val gson = Gson()

    override fun handleGameUpdate(mapState: MapState): DesiredCellsState? {
        val mapStateHashMap = convertMapStateToHashMap(mapState)

        val resultHashMap = methodChannel.invokeMethodSync(
            Constants.HANDLE_GAME_UPDATE,
            mapStateHashMap
        ) as? HashMap<String, Any?>

//        return gson.mapToObject(resultHashMap)
        return mapToDesiredCellsState(resultHashMap)
    }

    private fun convertMapStateToHashMap(mapState: MapState): HashMap<String, Any> {
        return hashMapOf(
            "gameTick" to mapState.gameTick,
            "myCells" to mapState.myCells.map {
                hashMapOf(
                    "cellId" to it.cellId.id,
                    "property" to hashMapOf(
                        "mass" to it.property.mass,
                        "radius" to it.property.radius,
                        "speed" to it.property.speed,
                        "position" to it.property.position.asHashMap(),
                        "velocity" to it.property.velocity.asHashMap(),
                        "eatEfficiency" to it.property.eatEfficiency,
                    ),
                    "availableEnergy" to it.availableEnergy,
                    "canSplit" to it.canSplit,
                    "canMerge" to it.canSplit
                )
            },
            "alienCells" to mapState.alienCells.map {
                hashMapOf(
                    "cellId" to it.cellId.id,
                    "property" to hashMapOf(
                        "mass" to it.property.mass,
                        "radius" to it.property.radius,
                        "speed" to it.property.speed,
                        "position" to it.property.position.asHashMap(),
                        "velocity" to it.property.velocity.asHashMap(),
                        "eatEfficiency" to it.property.eatEfficiency,
                    )
                )
            },
            "food" to mapState.food.map {
                hashMapOf(
                    "id" to it.id,
                    "mass" to it.mass,
                    "position" to it.position.asHashMap()
                )
            },
        )
    }

    private fun mapToDesiredCellsState(resultHashMap: HashMap<String, Any?>?): DesiredCellsState? {
        if (resultHashMap == null) return null

        try {
            val myCells = resultHashMap["myCells"] as List<HashMap<String, Any?>>

            return DesiredCellsState(myCells = myCells.map {
                CellActivity(
                    cellId = CellId(it["cellId"] as String),
                    speed = (it["speed"] as Double).toFloat(),
                    velocity = gson.mapToObject(it["velocity"] as? HashMap<String, Any?>),
                    growIntention = gson.mapToObject(it["growIntention"] as? HashMap<String, Any?>),
                    additionalAction = mapAdditionalAction(it["additionalAction"] as? HashMap<String, Any?>)
                )
            })
        } catch (e: Exception) {
            e.printStackTrace()
            return null
        }
    }

    private fun mapAdditionalAction(hashMap: HashMap<String, Any?>?): MoveAction? {
        if (hashMap == null) return null

        if ((hashMap["type"] as String) == "merge") return MoveAction.Merge(
            cellId = CellId(hashMap["cellId"] as String)
        )

        return MoveAction.Split
    }


}





