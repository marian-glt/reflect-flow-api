package com.rf.reflect_flow_api.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.net.URL;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LearningResource {
    private String title;
    private URL url;
    private String notes;
}
