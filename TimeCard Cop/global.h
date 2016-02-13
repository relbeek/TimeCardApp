/***********************TIME CARD COP***************************
****************************************************************
*****   Global.h is the header file that is defining the   *****
*****          structure of the charge code data           *****
*****         Created by Ryan S Truran on 2/12/16          ***** 
*****   Copyright 2015 Trü App Dev. All rights reserved    *****
****************************************************************
****************************************************************
*/

#import <UIKit/UIKit.h>
/*  Variable Description
---------------------
Charge		Charge is the structure that will be saved in memory. 
Code		Code is the charge code that should be displayed. 
Nickname	Nickname is what the more user friendly name is for that specific charge code.
Hours       Hours worked on the charge code
Order		This will keep the charge codes organized when listed per day		
Date		The Date will be stored with the charge code to allow viewing of previews days
Comments	Any Comments associated with the specific Charge Code
*/
/*  Additional Ideas

Ability to check percentages of BreakDown day by what program you were on.
to do this I would need to add program variable to charge


*/

struct{
	NSString code;			//Code
	NSString nickname;		//Nickname
	NSString Hours; 		//Hours
	unsigned int order;		//Order
	NSString Date;			//Date
	NSString Comments;		//Comments
	unsigned int month;		//Month
	unsigned int day;		//Day
	unsigned int week; 		//Week
	unsigned int year;		//Year
	NSString program;		//Program
}charge[100000];