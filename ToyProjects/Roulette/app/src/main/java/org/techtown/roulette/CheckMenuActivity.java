package org.techtown.roulette;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.SparseBooleanArray;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class CheckMenuActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_check_menu);

        Vector<String> selectedMenu = new Vector<String>();

        CheckBox burgerkingCheck = (CheckBox) findViewById(R.id.checkBox_check_burgerking);
        CheckBox gunaeCheck = (CheckBox) findViewById(R.id.checkBox_check_gunaesikdang);
        CheckBox haewallCheck = (CheckBox) findViewById(R.id.checkBox_check_haewall);
        CheckBox chinaCheck = (CheckBox) findViewById(R.id.checkBox_check_china);
        CheckBox myunggaCheck = (CheckBox) findViewById(R.id.checkBox_check_myungga);
        CheckBox sundaeCheck = (CheckBox) findViewById(R.id.checkBox_check_sundae);
        CheckBox donkachuCheck = (CheckBox) findViewById(R.id.checkBox_check_donkachu);
        CheckBox naemyunCheck = (CheckBox) findViewById(R.id.checkBox_check_naemyun);
        Button confirmButton = (Button) findViewById(R.id.button_check_confirm);

        confirmButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent check_to_Result = new Intent(getApplicationContext(),ResultActivity.class);

                if(burgerkingCheck.isChecked()) { selectedMenu.add(burgerkingCheck.getText().toString()); }
                if(gunaeCheck.isChecked()) { selectedMenu.add(gunaeCheck.getText().toString()); }
                if(haewallCheck.isChecked()) { selectedMenu.add(haewallCheck.getText().toString()); }
                if(chinaCheck.isChecked()) { selectedMenu.add(chinaCheck.getText().toString()); }
                if(myunggaCheck.isChecked()) { selectedMenu.add(myunggaCheck.getText().toString()); }
                if(sundaeCheck.isChecked()) { selectedMenu.add(sundaeCheck.getText().toString()); }
                if(donkachuCheck.isChecked()) { selectedMenu.add(donkachuCheck.getText().toString()); }
                if(naemyunCheck.isChecked()) { selectedMenu.add(naemyunCheck.getText().toString()); }

                String[] selectedMenuArr = selectedMenu.toArray(new String[selectedMenu.size()]);

                check_to_Result.putExtra("selectedMenu", selectedMenuArr);

                if(selectedMenuArr.length > 0) {
                    startActivity(check_to_Result);
                    finish();
                } else {
                    Toast.makeText(CheckMenuActivity.this, "아무것도 안골랐잖아;;", Toast.LENGTH_LONG).show();
                }
            }
        });

    }
}