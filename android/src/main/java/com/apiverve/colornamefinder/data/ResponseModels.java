// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     ColorNameFinderData data = Converter.fromJsonString(jsonString);

package com.apiverve.colornamefinder.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static ColorNameFinderData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(ColorNameFinderData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(ColorNameFinderData.class);
        writer = mapper.writerFor(ColorNameFinderData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// ColorNameFinderData.java

package com.apiverve.colornamefinder.data;

import com.fasterxml.jackson.annotation.*;

public class ColorNameFinderData {
    private String inputHex;
    private RGB inputRGB;
    private boolean exactMatch;
    private Closest closestColor;
    private Closest[] closestMatches;
    private long totalNamedColors;

    @JsonProperty("input_hex")
    public String getInputHex() { return inputHex; }
    @JsonProperty("input_hex")
    public void setInputHex(String value) { this.inputHex = value; }

    @JsonProperty("input_rgb")
    public RGB getInputRGB() { return inputRGB; }
    @JsonProperty("input_rgb")
    public void setInputRGB(RGB value) { this.inputRGB = value; }

    @JsonProperty("exact_match")
    public boolean getExactMatch() { return exactMatch; }
    @JsonProperty("exact_match")
    public void setExactMatch(boolean value) { this.exactMatch = value; }

    @JsonProperty("closest_color")
    public Closest getClosestColor() { return closestColor; }
    @JsonProperty("closest_color")
    public void setClosestColor(Closest value) { this.closestColor = value; }

    @JsonProperty("closest_matches")
    public Closest[] getClosestMatches() { return closestMatches; }
    @JsonProperty("closest_matches")
    public void setClosestMatches(Closest[] value) { this.closestMatches = value; }

    @JsonProperty("total_named_colors")
    public long getTotalNamedColors() { return totalNamedColors; }
    @JsonProperty("total_named_colors")
    public void setTotalNamedColors(long value) { this.totalNamedColors = value; }
}

// Closest.java

package com.apiverve.colornamefinder.data;

import com.fasterxml.jackson.annotation.*;

public class Closest {
    private String name;
    private String hex;
    private double distance;
    private double similarity;
    private RGB rgb;

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("hex")
    public String getHex() { return hex; }
    @JsonProperty("hex")
    public void setHex(String value) { this.hex = value; }

    @JsonProperty("distance")
    public double getDistance() { return distance; }
    @JsonProperty("distance")
    public void setDistance(double value) { this.distance = value; }

    @JsonProperty("similarity")
    public double getSimilarity() { return similarity; }
    @JsonProperty("similarity")
    public void setSimilarity(double value) { this.similarity = value; }

    @JsonProperty("rgb")
    public RGB getRGB() { return rgb; }
    @JsonProperty("rgb")
    public void setRGB(RGB value) { this.rgb = value; }
}

// RGB.java

package com.apiverve.colornamefinder.data;

import com.fasterxml.jackson.annotation.*;

public class RGB {
    private long r;
    private long g;
    private long b;

    @JsonProperty("r")
    public long getR() { return r; }
    @JsonProperty("r")
    public void setR(long value) { this.r = value; }

    @JsonProperty("g")
    public long getG() { return g; }
    @JsonProperty("g")
    public void setG(long value) { this.g = value; }

    @JsonProperty("b")
    public long getB() { return b; }
    @JsonProperty("b")
    public void setB(long value) { this.b = value; }
}