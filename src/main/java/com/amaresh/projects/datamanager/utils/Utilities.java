package com.amaresh.projects.datamanager.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

import org.springframework.stereotype.Component;

@Component
public class Utilities {

	public BigDecimal truncateDecimal(final double x, final int numberofDecimals) {
		return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_DOWN);
	}

	public String getValueFormatter(BigDecimal bd) {
		DecimalFormat df = new DecimalFormat("###,###.##");
		return df.format(bd.doubleValue());
	}
}