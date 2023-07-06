package org.techtown.doitmission_07;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

public class MenuActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        TextView textView = findViewById(R.id.textView);
        Button button   = findViewById(R.id.button_cos);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.putExtra("MenuActivity_name","고객 관리");
                setResult(RESULT_OK,intent);
                finish();
            }
        });
        Button button1 = findViewById(R.id.button_sales);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                intent.putExtra("MenuActivity_name","매출 관리");
                setResult(RESULT_OK,intent);
                finish();
            }
        });
        Button button2 = findViewById(R.id.button_goods);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                intent.putExtra("MenuActivity_name","상품 관리");
                setResult(RESULT_OK,intent);
                finish();
            }
        });
    }
}