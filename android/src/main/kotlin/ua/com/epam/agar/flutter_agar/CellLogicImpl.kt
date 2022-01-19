package ua.com.epam.agar.flutter_agar


import com.google.gson.Gson
import io.flutter.plugin.common.MethodChannel
import ua.com.epam.agar.hackathon.core.entity.main.DesiredCellsState
import ua.com.epam.agar.hackathon.core.entity.main.MapState
import ua.com.epam.agar.hackathon.core.entity.public_api.CellLogic

class CellLogicImpl(private val methodChannel: MethodChannel) : CellLogic() {

    private val gson = Gson()


    override fun handleGameUpdate(mapState: MapState): DesiredCellsState? {
        val mapStateHashMap = hashMapOf(
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

        @Suppress("UNCHECKED_CAST")
        val resultMap = methodChannel.invokeMethodSync(
            Constants.HANDLE_GAME_UPDATE,
            mapStateHashMap
        ) as? HashMap<String, Any?> ?: return null

        val resultJson = gson.toJson(resultMap)

        return gson.fromJson(
            resultJson,
            DesiredCellsState::class.java
        )
    }


}





