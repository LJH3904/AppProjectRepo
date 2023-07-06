package org.techtown.roulette;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class endactivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_endactivity);

        int[] images = new int[] {
                R.drawable.burgerking,
                R.drawable.gunaesikdang,
                R.drawable.haewall,
                R.drawable.china,
                R.drawable.myungga,
                R.drawable.sundae,
                R.drawable.donkachu,
                R.drawable.naemyun
        };
        String[] images_name = new String[]{
                "버거킹",
                "법구",
                "해월",
                "금석궁",
                "명가",
                "순대국",
                "목동카츠",
                "육쌈냉면"
        };
        TextView textView = findViewById(R.id.textView_end_result);

        Intent get_Intent = getIntent(); // ResultActivity에서 Intent 객체 받아옴
        String winData = get_Intent.getStringExtra("Result_imageId"); // ResultActivity에서 putExtra 를 받아옴
        ImageView imageView_food = (ImageView) findViewById(R.id.imageView_end_result);

        for(int i = 0; i < 8; i++) {
            if(winData.equals(images_name[i])) {
                imageView_food.setBackgroundResource(images[i]);
                TextView resultTextView = findViewById(R.id.textView_end_result);
                resultTextView.setText(images_name[i]);
            }
        }

        //imageView_food.setBackgroundResource(images[i]);
        //textView.setText(images_name[i]);
    }
}