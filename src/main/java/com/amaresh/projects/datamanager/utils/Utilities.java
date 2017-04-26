package com.amaresh.projects.datamanager.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Calendar;
import java.util.TimeZone;

import org.springframework.stereotype.Component;

@Component
public class Utilities {

	public BigDecimal truncateDecimal(final double x, final int numberofDecimals) {
		return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_DOWN);
	}

	public String getValueFormatter(BigDecimal bd) {
		DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance();
		symbols.setGroupingSeparator(',');

		DecimalFormat formatter = new DecimalFormat("###,###.##", symbols);
		String str = formatter.format(bd.longValue());
		str.replaceAll(",", ", ");
		return formatter.format(bd.longValue());
	}

	public String convertEpochTimeToDateForReports(long timeEpoch, String timeZone) {
		if (timeEpoch > 0) {
			Calendar timestampCal = Calendar.getInstance();
			String cleanTZ = getCleanTZ(timeZone);
			String hoursStr = "";
			String minutesStr = "";
			String secondsStr = "";
			String monthStr = "";
			String dayStr = "";
			timestampCal.setTimeInMillis(timeEpoch * 1000);
			timestampCal.setTimeZone(TimeZone.getTimeZone(cleanTZ));
			int year = timestampCal.get(Calendar.YEAR);
			int month = timestampCal.get(Calendar.MONTH) + 1;
			int day = timestampCal.get(Calendar.DATE);
			int hours = timestampCal.get(Calendar.HOUR_OF_DAY);
			int minutes = timestampCal.get(Calendar.MINUTE);
			int seconds = timestampCal.get(Calendar.SECOND);
			monthStr = checkDateTimeFormat(month);
			dayStr = checkDateTimeFormat(day);
			hoursStr = checkDateTimeFormat(hours);
			minutesStr = checkDateTimeFormat(minutes);
			secondsStr = checkDateTimeFormat(seconds);
			//String tmpStr = monthStr + "/" + dayStr + "/" + year + " " + hoursStr + ":" + minutesStr + ":" + secondsStr;
			String tmpStr = dayStr + "/" + monthStr + "/" + year;
			return tmpStr;
		} else {
			return "NA";
		}

	}

	private String getCleanTZ(String timeZone) {
		String cleanTZ = null;
		if (timeZone != null) {
			if (timeZone.equalsIgnoreCase("PST") || timeZone.equalsIgnoreCase("PDT")) {
				cleanTZ = "PST8PDT";
			} else if (timeZone.equalsIgnoreCase("MST") || timeZone.equalsIgnoreCase("MDT")) {
				cleanTZ = "MST7MDT";
			} else if (timeZone.equalsIgnoreCase("CST") || timeZone.equalsIgnoreCase("CDT")) {
				cleanTZ = "CST6CDT";
			} else if (timeZone.equalsIgnoreCase("EST") || timeZone.equalsIgnoreCase("EDT")) {
				cleanTZ = "EST5EDT";
			} else if (timeZone.equalsIgnoreCase("GMT")) {
				cleanTZ = "GMT";
			} else if (timeZone.equalsIgnoreCase("COT")) {
				cleanTZ = "GMT-05:00";
			} else {
				cleanTZ = timeZone;
			}
		}
		return cleanTZ;
	}

	private String checkDateTimeFormat(int dateTime) {
		String formatedString;
		if (dateTime < 10 && dateTime >= 0) {
			formatedString = "0" + dateTime;
		} else {
			formatedString = String.valueOf(dateTime);
		}
		return formatedString;
	}
}