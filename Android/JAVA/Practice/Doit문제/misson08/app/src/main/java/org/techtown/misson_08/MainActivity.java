package org.techtown.misson_08;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    private static final int REQUEST_CODE_MAIN  = 1;
    EditText editText_login_Id,editText_login_Password;

    public static final String MainActivity_DATA = "MainActivity";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);


        editText_login_Id = findViewById(R.id.editText_login_Id);
        editText_login_Password = findViewById(R.id.editText_login_Password);
        TextView textView_Result = findViewById(R.id.textView_Result);

        Intent get_Intent = getIntent();
        String get_Intent_name = get_Intent.getStringExtra("name");
        textView_Result.setText(get_Intent_name);

        Button button = findViewById(R.id.button_login_Login);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String IdCheck = editText_login_Id.getText().toString();
                String PassCheck = editText_login_Password.getText().toString();


                if(IdCheck.length() == 0  || PassCheck.length() == 0){
                    Toast.makeText(MainActivity.this, "아이디와 비밀번호를 입력해주세요.", Toast.LENGTH_LONG).show();

                    // 사용자 이름이나 비밀번호가 입력되지 않았을 경우 나오는 토스트 메시지
                } else {// else문 까지 안하고 그냥 if문에서 빠져 나가면 다른 액티비티로 넘어감

                    Intent login_intent = new Intent(getApplicationContext(), MenuActivity.class);
                    login_intent.putExtra("name","mainActivity");
                    login_intent.putExtra("id",IdCheck);
                    login_intent.putExtra("password",PassCheck);
                    startActivityForResult(login_intent,REQUEST_CODE_MAIN);
                    finish();
                }

            }
        });
    }//onCreate
//    @Override
//    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
//        super.onActivityResult(requestCode, resultCode, data);
//
//        if (requestCode == REQUEST_CODE_MAIN) {
//            if (resultCode != Activity.RESULT_OK) {
//                return;
//            }
//            String sendText = data.getExtras().getString("sendText");
//
//        }
//    }


}