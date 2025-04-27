package com.rf.reflect_flow_api.model;


import lombok.*;

import java.io.File;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class JournalNote {
    private String title;
    private String content;
    private File image;
}
