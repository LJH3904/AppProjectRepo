package org.techtown.misson_08;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MenuActivity extends AppCompatActivity {
    private static final int REQUEST_CODE_MENU  = 2;
    private static String ID = null;
    private static String PW = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        Button button_customer = findViewById(R.id.button_menu_customer);
        Button button_sales = findViewById(R.id.button_menu_sales);
        Button button_goods = findViewById(R.id.button_menu_goods);

        TextView textView_Result = findViewById(R.id.textView_menu_Result);


        //이전 액티비티에서 보낸 값을 받아오는 코드
        Intent get_Intent = getIntent();
        String get_Intent_name = get_Intent.getStringExtra("name");
        ID = get_Intent.getStringExtra("id");
        PW = get_Intent.getStringExtra("password");
        //텍스트 뷰에 어디 액티비티에서 왔는지 입력
        textView_Result.setText("액티비티 : " + get_Intent_name + " \n id : " + ID +"\n pass : "+PW );

        button_customer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent customer_intent = new Intent(getApplicationContext(),CustomerActivity.class);
                customer_intent.putExtra("name","MenuActivity");
                startActivityForResult(customer_intent,REQUEST_CODE_MENU);
                finish();
                //customer로
            }
        });
        button_sales.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent sales_intent = new Intent(getApplicationContext(),SalesActivity.class);
                sales_intent.putExtra("name","MenuActivity");
                startActivityForResult(sales_intent,REQUEST_CODE_MENU);
                finish();
                //sales로
            }
        });
        button_goods.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent goods_intent = new Intent(getApplicationContext(),GoodsActivity.class);
                goods_intent.putExtra("name","MenuActivity");
                startActivityForResult(goods_intent,REQUEST_CODE_MENU);
                finish();
                //goods로
            }
        });

    }
}