import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.ZoneId;

public class TimeInCST {
    public static void main(String[] args) {
        ZoneId cstZone = ZoneId.of("America/Chicago");
        ZonedDateTime cstTime = ZonedDateTime.now(cstZone);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss z");
        String formattedTime = cstTime.format(formatter);
        System.out.println("Current time in CST: " + formattedTime);
    }
}
