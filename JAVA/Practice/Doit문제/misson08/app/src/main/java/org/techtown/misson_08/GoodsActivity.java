package org.techtown.misson_08;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class GoodsActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_goods);
        Button button_Menu = findViewById(R.id.button_goods_menu);
        Button button_Login = findViewById(R.id.button_goods_login);

        //이전 액티비티에서 보낸 값을 받아오는 코드
        TextView textView_Result  = findViewById(R.id.textView_goods_Result);
        Intent get_Intent = getIntent();
        String get_Intent_name = get_Intent.getStringExtra("name");

        //텍스트 뷰에 어디 액티비티에서 왔는지 입력
        textView_Result.setText(get_Intent_name);

        button_Login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent Goods_to_Login_Intent = new Intent(getApplicationContext(),MainActivity.class);
                Goods_to_Login_Intent.putExtra("name","GoodsActivity");
                startActivity(Goods_to_Login_Intent);
finish();
            }
        });
        button_Menu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent Goods_to_Menu_Intent = new Intent(getApplicationContext(),MenuActivity.class);
                Goods_to_Menu_Intent.putExtra("name","GoodsActivity");
                startActivity(Goods_to_Menu_Intent);
finish();
            }
        });
    }
}