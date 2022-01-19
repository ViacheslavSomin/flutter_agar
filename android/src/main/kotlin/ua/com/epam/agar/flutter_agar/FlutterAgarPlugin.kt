package ua.com.epam.agar.flutter_agar


import android.util.Log
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import ua.com.epam.agar.engine.GameEngine

/** FlutterAgarPlugin */
class FlutterAgarPlugin : FlutterPlugin, MethodCallHandler {

    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, Constants.CHANNEL_NAME)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            Constants.INITIALIZE_GAME_ENGINE -> {
                initializeGameEngine()
                result.success(null)
            }
            Constants.START_GAME -> {
                val roomId: String = call.argument(Constants.ROOM_ID)!!
                startGame(roomId)
                result.success(null)
            }
            Constants.STOP_GAME -> {
                stopGame()
                result.success(null)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun initializeGameEngine() {
        try {
            GameEngine.initialize(CellLogicImpl(channel))
        } catch (e: IllegalArgumentException) {
            Log.d(Constants.TAG, e.localizedMessage ?: "")
        }
    }

    private fun startGame(roomId: String) {
        GameEngine.startGame(roomId,false)
    }

    private fun stopGame() {
        GameEngine.stopGame()
    }
}
