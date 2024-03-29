package com.example.kotlinlab

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.widget.ImageView
import java.util.concurrent.Executors

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val imageView = findViewById<ImageView>(R.id.splashImage)
        val handler = Handler(Looper.getMainLooper())

        Executors.newSingleThreadExecutor().execute {
            val url = "https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg"

            try {
                val `in` = java.net.URL(url).openStream()
                val image = BitmapFactory.decodeStream(`in`)

                handler.post {
                    imageView.setImageBitmap(image)
                }
            }
            catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }
}
