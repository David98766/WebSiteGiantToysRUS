/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utilities;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/**
 *
 * @author I586662
 */
public class Formatter {
      public static String formatDouble(double number) {
        // Create a DecimalFormat object with pattern "#.##" for two decimal places
        DecimalFormat decimalFormat = new DecimalFormat("#.00");

        // Format the double using the DecimalFormat
        return decimalFormat.format(number);
    }
      

    public static Date addDaysToFormattedDate(Date originalDate, int daysToAdd) {
        // Convert java.sql.Date to java.util.Calendar
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(originalDate);

        // Add days to Calendar
        calendar.add(Calendar.DAY_OF_MONTH, daysToAdd);

        // Convert back to java.sql.Date
        Date newSqlDate = new Date(calendar.getTimeInMillis());

        return newSqlDate;
    }
    
     public static String formatAsYearMonthDay(Date date) {
        // Format the date as "year/month/day"
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        return sdf.format(date);
    }
     public static Date convertToSqlDate(String dateString) {
        try {
            SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = originalFormat.parse(dateString);
            return new Date(utilDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return null; // or throw an exception
        }
    }

    
}
