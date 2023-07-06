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

public class MainActivity_ktw extends AppCompatActivity {

    MediaPlayer mediaPlayer;
    int voice_flag = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_ktw);

        ListView listView = findViewById(R.id.listView);
        List<String> list = new ArrayList<>();
        list.add("난 유자스무디");
        list.add("아냐 아냐 가만히 있어");
        list.add("으억..");

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
                                MediaPlayer.create(MainActivity_ktw.this, R.raw.ktw_1);
                        mediaPlayer.start();
                        //난 유자스무디
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 1) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_ktw.this, R.raw.ktw_2);
                        mediaPlayer.start();
                        //아냐 아냐 가만히 있어
                        sleep(4000);
                        voice_flag = 0;
                    }
                    if (position == 2) {
                        voice_flag = 1;
                        mediaPlayer = MediaPlayer.create(MainActivity_ktw.this, R.raw.ktw_3);
                        mediaPlayer.start();
                        //으억..
                        sleep(4000);
                        voice_flag = 0;
                    }
                }
            }
        });


    }
}