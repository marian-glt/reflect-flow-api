package com.rf.reflect_flow_api.controller;

import com.rf.reflect_flow_api.model.PomodoroClock;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.UUID;

@RestController
@RequestMapping("/api")
public class ReflectFlowController {

    @GetMapping("/get-clocks")
    public ResponseEntity<?> getClockHistory(
            @RequestHeader(name="Authorization") String token
    ){
        return null;
    }

    @GetMapping("/clock/{id}")
    public ResponseEntity<?> getClock(
            @RequestHeader(name="Authorization") String token,
            @PathVariable UUID id)
    {
        return null;
    }

    @PostMapping("/start-clock")
    public ResponseEntity<?> postNewClock(
            @RequestHeader(name="Authorization") String token,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startTime
    ){
        final LocalDateTime now = LocalDateTime.now();

        if(now.isBefore(startTime)){
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }

        final LocalDateTime endTime = startTime.plusMinutes(30);

        final PomodoroClock clock = new PomodoroClock(UUID.randomUUID(), startTime, endTime);

        return new ResponseEntity<>(clock, HttpStatus.CREATED);
    }
}
