package org.techtown.toyproject_championselector;

import static android.os.SystemClock.sleep;

import android.content.Intent;
import android.graphics.Color;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.MediaStore;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

public class MainActivity_kih extends AppCompatActivity {
Button btn_play;
Button btn_stop;
    private Long mLastClickTime = 0L;

MediaPlayer mediaPlayer;
int voice_flag = 0;
//ImageView imageView = findViewById(R.id.imageView);

//    @Override
//    protected void onDestroy(){
//        super.onDestroy();
//        if(mediaPlayer != null){
//            mediaPlayer.release();
//            mediaPlayer = null;
//
//        }
//    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_kih);


        ImageView imageView = findViewById(R.id.imageView);

        Button changeBtn = (Button) findViewById(R.id.button4);
        ListView listView = findViewById(R.id.listView);
        List<String> list = new ArrayList<>();
        list.add("그럴수도 있긴해");
        list.add("네~!");
        list.add("당했다 ..");

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,list){
            @Override
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
                sleep(500);
                if (position == 0) {
                                    mediaPlayer = MediaPlayer.create(MainActivity_kih.this, R.raw.kih_1);
                                    mediaPlayer.start();


                        }
                            //그럴수도 있긴해
                    if (position == 1) {

                        mediaPlayer = MediaPlayer.create(MainActivity_kih.this, R.raw.kih_2);
                        mediaPlayer.start();
                        //네 !~

                    }
                    if (position == 2) {

                        mediaPlayer = MediaPlayer.create(MainActivity_kih.this, R.raw.kih_3);
                        mediaPlayer.start();
                        //아 협박까지 당했다 ..


                    }
                }
        });

        changeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Intent.ACTION_PICK);
                intent.setDataAndType(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, "image/*");
                intent.setAction(Intent.ACTION_PICK);
                activityResultLauncher.launch(intent);

            }
        });
    }//onCreate

    ActivityResultLauncher<Intent> activityResultLauncher = registerForActivityResult(
            new ActivityResultContracts.StartActivityForResult(),
            new ActivityResultCallback<ActivityResult>() {
                @Override
                public void onActivityResult(ActivityResult result) {
                    if(result.getResultCode() == RESULT_OK) {
                        Intent intent = result.getData();
                        Uri uri = intent.getData();
                        ImageView imageView = findViewById(R.id.imageView);
                        imageView.setImageURI(uri);
                    }
                }
            }
    );

    }
