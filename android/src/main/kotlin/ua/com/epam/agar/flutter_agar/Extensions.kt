package ua.com.epam.agar.flutter_agar

import android.os.Handler
import android.os.Looper
import com.google.gson.Gson
import io.flutter.plugin.common.MethodChannel
import kotlin.reflect.full.memberProperties


inline fun <reified T : Any> T.asHashMap(): HashMap<String, Any?> {
    val props = T::class.memberProperties.associateBy { it.name }
    return HashMap(props.keys.associateWith { props[it]?.get(this) })
}

inline fun <reified T : Any> Gson.mapToObject(map: HashMap<String, Any?>?): T? {
    if (map==null) return null

    val json = this.toJson(map)

    return this.fromJson(json, T::class.java)
}


class CallResult(
    @Volatile var completed: Boolean = false,
    @Volatile var value: Any? = null
)

@Synchronized
fun MethodChannel.invokeMethodSync(method: String, arguments: Any?): Any? {
    val callResult = CallResult()

    Handler(Looper.getMainLooper()).post {
        this.invokeMethod(method, arguments, object : MethodChannel.Result {
            override fun success(result: Any?) {
                callResult.value = result
                callResult.completed = true
            }

            override fun error(code: String?, msg: String?, details: Any?) {
                callResult.value = null
                callResult.completed = true
            }

            override fun notImplemented() {
                callResult.value = null
                callResult.completed = true
            }
        })
    }
    try {
        while (!callResult.completed) {
            // Wait for completing of result
        }
    } catch (e: InterruptedException) {
        return null
    }
    return callResult.value
}