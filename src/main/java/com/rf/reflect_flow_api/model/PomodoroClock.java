package com.rf.reflect_flow_api.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PomodoroClock {
    private UUID clockId;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
}
