package com.example.picture_story_time

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant 
import com.github.eybisi.fluttertts.FlutterTtsPlugin;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        FlutterTtsPlugin.registerWith(flutterEngine) // Register the flutter_tts plugin
    }
}
