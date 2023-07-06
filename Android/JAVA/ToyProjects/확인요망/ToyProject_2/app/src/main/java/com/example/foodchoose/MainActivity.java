package com.example.foodchoose;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button Random_Button = findViewById(R.id.button);
        int[] images = new int[] {R.drawable.burgerking,R.drawable.gunaesikdang,R.drawable.haewall,R.drawable.myungga,R.drawable.sundae
        };
        Random_Button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ImageView imageView_food = (ImageView) findViewById(R.id.imageView2);
                int imageId = (int) (Math.random() * images.length);
                imageView_food.setBackgroundResource(images[imageId]);

            }
        });
    }
}