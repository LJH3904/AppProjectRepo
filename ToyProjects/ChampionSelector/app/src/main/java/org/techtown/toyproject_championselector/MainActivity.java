package org.techtown.toyproject_championselector;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //김인항
        Button button_kih = findViewById(R.id.button_kih);
        button_kih.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_kih = new Intent(getApplicationContext(),MainActivity_kih.class);
                startActivity(intent_kih);
            }
        });
        //----------------------------------------

        //김태원
        Button button_ktw = findViewById(R.id.button_ktw);
        button_ktw.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_ktw = new Intent(getApplicationContext(),MainActivity_ktw.class);
                startActivity(intent_ktw);
            }
        });
        //----------------------------------------

        //노은흠
        Button button_nouh = findViewById(R.id.button_nouh);
        button_nouh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_nouh = new Intent(getApplicationContext(),MainActivity_nouh.class);
                startActivity(intent_nouh);
            }
        });
        //----------------------------------------

        //박영현
        Button button_pyh = findViewById(R.id.button_pyh);
        button_pyh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_pyh = new Intent(getApplicationContext(),MainActivity_pyh.class);
                startActivity(intent_pyh);
            }
        });
        //----------------------------------------

        //이제현
        Button button_ljh = findViewById(R.id.button_ljh);
        button_ljh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_ljh = new Intent(getApplicationContext(),MainActivity_ljh.class);
                startActivity(intent_ljh);
            }
        });
        //----------------------------------------

        //이준석
        Button button_ljs = findViewById(R.id.button_ljs);
        button_ljs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_ljs = new Intent(getApplicationContext(),MainActivity_ljs.class);
                startActivity(intent_ljs);
            }
        });
        //----------------------------------------

        //윤영진
        Button button_yyj = findViewById(R.id.button_yyj);
        button_yyj.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_yyj = new Intent(getApplicationContext(),MainActivity_yyj.class);
                startActivity(intent_yyj);
            }
        });
        //----------------------------------------

        //엄희준
        Button button_uhj = findViewById(R.id.button_uhj);
        button_uhj.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_uhj = new Intent(getApplicationContext(),MainActivity_uhj.class);
                startActivity(intent_uhj);
            }
        });
        //----------------------------------------

        //조현기
        Button button_jhk = findViewById(R.id.button_jhk);
        button_jhk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent_jhk = new Intent(getApplicationContext(),MainActivity_jhk.class);
                startActivity(intent_jhk);
            }
        });
        //----------------------------------------
    }
}