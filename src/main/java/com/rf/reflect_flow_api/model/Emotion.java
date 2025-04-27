package com.rf.reflect_flow_api.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Emotion {
    private UUID emotionId;
    private String emotionName;
}
