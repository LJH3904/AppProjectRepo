package org.techtown.toyproject_championselector;

import static android.os.SystemClock.sleep;

import android.graphics.Color;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

public class MainActivity_yyj extends AppCompatActivity {

    MediaPlayer mediaPlayer;
    int voice_flag = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_yyj);

        ListView listView = findViewById(R.id.listView);
        List<String> list = new ArrayList<>();
        list.add("음 알았다~");
        list.add("한국전쟁 개마렵네");
        list.add("공익컷트라인 개높네");

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,list){
            public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
                View view = super.getView(position, convertView, parent);
                TextView tv = (TextView)view.findViewById(android.R.id.text1);
                tv.setTextColor(Color.WHITE);
                return view;
            }
        };
        listView.setAdapter(adapter);


        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
                if (voice_flag == 0) {
                    if (position == 0) {
                        voice_flag = 1;
                        mediaPlayer =
                                MediaPlayer.create(MainActivity_yyj.this, R.raw.yyj_1);
                        mediaPlayer.start();
                        //음 알았다~
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 1) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_yyj.this, R.raw.yyj_2);
                        mediaPlayer.start();
                        //한국전쟁 개마렵네
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 2) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_yyj.this, R.raw.yyj_3);
                        mediaPlayer.start();
                        //공익컷트라인 개높네
                        sleep(4000);
                        voice_flag = 0;
                    }
                }
            }
        });
    }
}