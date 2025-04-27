package com.rf.reflect_flow_api.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MoodRecording {
    private LocalDateTime recordedAt;
    private Emotion emotion;
    private String notes;
}
