package org.techtown.roulette;

import static java.lang.Thread.sleep;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Vector;


public class ResultActivity extends AppCompatActivity {
public static int ID = 0;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);
        Intent intent = getIntent();
        String [] data = intent.getStringArrayExtra("selectedMenu");
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

        Button button_okay = findViewById(R.id.button_result_okay);
        Button button_cancle = findViewById(R.id.button_result_cancle);
        Button button_roulette = findViewById(R.id.button_result_roulette);

        button_okay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent Result_to_end = new Intent(getApplicationContext(),endactivity.class);
                Result_to_end.putExtra("Result_imageId",data[ID]);
                startActivity(Result_to_end);
                finish();
            }
        });
        button_cancle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent Result_to_main = new Intent(getApplicationContext(),MainActivity.class);
                startActivity(Result_to_main);
                finish();
            }
        });
        button_roulette.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                /*
                try
                {
                    ImageView imageView_food = (ImageView) findViewById(R.id.imageView_result_image);
                    ID = (int) (Math.random() * images.length);
                    imageView_food.setBackgroundResource(images[ID]);
                    TextView textView = findViewById(R.id.textView_result_result);
                    textView.setText(images_name[ID]);
                    sleep(1000);
                } catch (InterruptedException e)
                {
                    e.printStackTrace();
                }
                */

                try {
                    ImageView imageView_food = (ImageView) findViewById(R.id.imageView_result_image);
                    ID = (int) (Math.random() * data.length);
                    for(int i = 0; i < 8; i++) {
                        if(data[ID].equals(images_name[i])) {
                            imageView_food.setBackgroundResource(images[i]);
                            TextView textView = findViewById(R.id.textView_result_result);
                            textView.setText(images_name[i]);
                        }
                    }
                    sleep(1000);
                } catch (InterruptedException e)
                {
                    Toast.makeText(ResultActivity.this, "예외처리", Toast.LENGTH_LONG).show();
                    e.printStackTrace();
                }

            }
        });

    }
}