/**
 * Marlin 3D Printer Firmware
 * Copyright (C) 2016 MarlinFirmware [https://github.com/MarlinFirmware/Marlin]
 *
 * Based on Sprinter and grbl.
 * Copyright (C) 2011 Camiel Gubbels / Erik van der Zalm
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

// 100k bed thermistor
const short temptable_1[][2] PROGMEM = {
	{	23 * OVERSAMPLENR, 300-TEMPER_OFFSET },
	{	25 * OVERSAMPLENR, 295-TEMPER_OFFSET },
	{	27 * OVERSAMPLENR, 290-TEMPER_OFFSET },
	{	28 * OVERSAMPLENR, 285-TEMPER_OFFSET },
	{	31 * OVERSAMPLENR, 280-TEMPER_OFFSET },
	{	33 * OVERSAMPLENR, 275-TEMPER_OFFSET },
	{	35 * OVERSAMPLENR, 270-TEMPER_OFFSET },
	{	38 * OVERSAMPLENR, 265-TEMPER_OFFSET },
	{	41 * OVERSAMPLENR, 260-TEMPER_OFFSET },
	{	44 * OVERSAMPLENR, 255-TEMPER_OFFSET },
	{	48 * OVERSAMPLENR, 250-TEMPER_OFFSET },
	{	52 * OVERSAMPLENR, 245-TEMPER_OFFSET },
	{	56 * OVERSAMPLENR, 240-TEMPER_OFFSET },
	{	61 * OVERSAMPLENR, 235-TEMPER_OFFSET },
	{	66 * OVERSAMPLENR, 230-TEMPER_OFFSET },
	{	71 * OVERSAMPLENR, 225-TEMPER_OFFSET },
	{	78 * OVERSAMPLENR, 220-TEMPER_OFFSET },
	{	84 * OVERSAMPLENR, 215-TEMPER_OFFSET },
	{	92 * OVERSAMPLENR, 210-TEMPER_OFFSET },
	{  100 * OVERSAMPLENR, 205-TEMPER_OFFSET },
	{  109 * OVERSAMPLENR, 200-TEMPER_OFFSET },
	{  120 * OVERSAMPLENR, 195-TEMPER_OFFSET },
	{  131 * OVERSAMPLENR, 190-TEMPER_OFFSET },
	{  143 * OVERSAMPLENR, 185-TEMPER_OFFSET },
	{  156 * OVERSAMPLENR, 180-TEMPER_OFFSET },
	{  171 * OVERSAMPLENR, 175-TEMPER_OFFSET },
	{  187 * OVERSAMPLENR, 170-TEMPER_OFFSET },
	{  205 * OVERSAMPLENR, 165-TEMPER_OFFSET },
	{  224 * OVERSAMPLENR, 160-TEMPER_OFFSET },
	{  245 * OVERSAMPLENR, 155-TEMPER_OFFSET },
	{  268 * OVERSAMPLENR, 150-TEMPER_OFFSET },
	{  293 * OVERSAMPLENR, 145-TEMPER_OFFSET },
	{  320 * OVERSAMPLENR, 140-TEMPER_OFFSET },
	{  348 * OVERSAMPLENR, 135-TEMPER_OFFSET },
	{  379 * OVERSAMPLENR, 130-TEMPER_OFFSET },
	{  411 * OVERSAMPLENR, 125-TEMPER_OFFSET },
	{  445 * OVERSAMPLENR, 120-TEMPER_OFFSET },
	{  480 * OVERSAMPLENR, 115-TEMPER_OFFSET },
	{  516 * OVERSAMPLENR, 110-TEMPER_OFFSET },
	{  553 * OVERSAMPLENR, 105-TEMPER_OFFSET },
	{  591 * OVERSAMPLENR, 100-TEMPER_OFFSET },
	{  628 * OVERSAMPLENR,	95-TEMPER_OFFSET },
	{  665 * OVERSAMPLENR,	90-TEMPER_OFFSET },
	{  702 * OVERSAMPLENR,	85-TEMPER_OFFSET },
	{  737 * OVERSAMPLENR,	80-TEMPER_OFFSET },
	{  770 * OVERSAMPLENR,	75-TEMPER_OFFSET },
	{  801 * OVERSAMPLENR,	70-TEMPER_OFFSET },
	{  830 * OVERSAMPLENR,	65-TEMPER_OFFSET },
	{  857 * OVERSAMPLENR,	60-TEMPER_OFFSET },
	{  881 * OVERSAMPLENR,	55-TEMPER_OFFSET },
	{  903 * OVERSAMPLENR,	50-TEMPER_OFFSET },
	{  922 * OVERSAMPLENR,	45-TEMPER_OFFSET },
	{  939 * OVERSAMPLENR,	40-TEMPER_OFFSET },
	{  954 * OVERSAMPLENR,	35-TEMPER_OFFSET },
	{  966 * OVERSAMPLENR,	30-TEMPER_OFFSET },
	{  977 * OVERSAMPLENR,	25-TEMPER_OFFSET },
	{  985 * OVERSAMPLENR,	20-TEMPER_OFFSET },
	{  993 * OVERSAMPLENR,	15-TEMPER_OFFSET },
	{  999 * OVERSAMPLENR,	10-TEMPER_OFFSET },
	{ 1004 * OVERSAMPLENR,	 5-TEMPER_OFFSET },
	{ 1008 * OVERSAMPLENR,	 0-TEMPER_OFFSET },
	{ 1012 * OVERSAMPLENR,	-5-TEMPER_OFFSET },
	{ 1016 * OVERSAMPLENR, -10-TEMPER_OFFSET },
	{ 1020 * OVERSAMPLENR, -15-TEMPER_OFFSET }
};
