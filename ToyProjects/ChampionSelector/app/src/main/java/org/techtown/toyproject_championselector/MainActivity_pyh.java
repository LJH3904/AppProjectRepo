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

public class MainActivity_pyh extends AppCompatActivity {

    MediaPlayer mediaPlayer;
    int voice_flag = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_pyh);

        ListView listView = findViewById(R.id.listView);
        List<String> list = new ArrayList<>();
        list.add("또 지랄하네");
        list.add("그럼 안이지 밖이야??");
        list.add("어헣어~");

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
                                MediaPlayer.create(MainActivity_pyh.this, R.raw.pyh_1);
                        mediaPlayer.start();
                        //또 지랄하네
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 1) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_pyh.this, R.raw.pyh_2);
                        mediaPlayer.start();
                        //그럼 안이지 밖이야??
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 2) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_pyh.this, R.raw.pyh_3);
                        mediaPlayer.start();
                        //어헣어~
                        sleep(4000);
                        voice_flag = 0;
                    }
                }
            }
        });
    }
}