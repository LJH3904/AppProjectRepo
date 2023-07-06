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

public class MainActivity_uhj extends AppCompatActivity {

    MediaPlayer mediaPlayer;
    int voice_flag = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_uhj);

        ListView listView = findViewById(R.id.listView);
        List<String> list = new ArrayList<>();
        list.add("기분이 째져~");
        list.add("에이~! 마요찌찌");
        list.add("와.. 아찔한데?");

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
                                MediaPlayer.create(MainActivity_uhj.this, R.raw.uhj_1);
                        mediaPlayer.start();
                        //기분이 째져~
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 1) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_uhj.this, R.raw.uhj_2);
                        mediaPlayer.start();
                        //에이~! 마요찌찌
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 2) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_uhj.this, R.raw.uhj_3);
                        mediaPlayer.start();
                        //와.. 아찔한데?
                        sleep(4000);
                        voice_flag = 0;
                    }
                }
            }
        });
    }
}