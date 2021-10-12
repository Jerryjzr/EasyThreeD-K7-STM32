#include "at24cxx.h"
#include "mks_reprint.h"
#include "mks_cfg.h"


DATA_REPRINT_ITMES mksReprint;
void mks_initPrint()
{
	mksReprint.mks_pausePrint_x = FILAMENT_CHANGE_X_POS;
	mksReprint.mks_pausePrint_y = FILAMENT_CHANGE_Y_POS;
	mksReprint.mks_pausePrint_z = FILAMENT_CHANGE_Z_ADD;
	mksReprint.mks_pausePrint_e = 5.0;
	mksReprint.waitEndMoves = 0;
	mksReprint.mks_printer_state = MKS_IDLE;

	mksReprint.sdpos = 0;

	memset(mksReprint.dirname,0,sizeof(mksReprint.dirname));
	memset(mksReprint.filename,0,sizeof(mksReprint.filename));

	mksReprint.sdprinting = 0;

	mksReprint.target_temperature_0 = 0;
 	mksReprint.target_temperature_bed = 0;

	mksReprint.resume = MKS_RESUME_IDLE;

	mksReprint.refresh = false;
	
}

void mks_WriteToEpr()        //��ͣ���ϵ�ʱ�������ݣ��Ա��ϵ������
{
        
	//�����ļ�λ��
	mksReprint.sdpos = card.getsdpos();
	epr_write_data(EPR_SAV_SDPOS, (uint8_t *)&mksReprint.sdpos,sizeof(mksReprint.sdpos));	
	
	//�����ӡͷ�¶�
	mksReprint.target_temperature_0 = thermalManager.target_temperature[0];
	epr_write_data(EPR_SAV_TARGET_TEMP_0, (uint8_t *)&mksReprint.target_temperature_0,sizeof(mksReprint.target_temperature_0));
	
	//�����ȴ��¶�
	if(HAS_TEMP_BED)
		{
		mksReprint.target_temperature_bed = thermalManager.target_temperature_bed;
		epr_write_data(EPR_SAV_TARGET_TEMP_BED, (uint8_t *)&mksReprint.target_temperature_bed,sizeof(mksReprint.target_temperature_bed));
		}
	
	//���浱ǰλ��
	epr_write_data(EPR_SAV_CUR_X, (uint8_t *)&mksReprint.current_position[0],sizeof(mksReprint.current_position[0]));
	epr_write_data(EPR_SAV_CUR_Y, (uint8_t *)&mksReprint.current_position[1],sizeof(mksReprint.current_position[1]));
	epr_write_data(EPR_SAV_CUR_Z, (uint8_t *)&mksReprint.current_position[2],sizeof(mksReprint.current_position[2]));
	epr_write_data(EPR_SAV_CUR_E, (uint8_t *)&mksReprint.current_position[3],sizeof(mksReprint.current_position[3]));
	//����Ŀ��λ��
	epr_write_data(EPR_SAV_DST_X, (uint8_t *)&mksReprint.destination[0],sizeof(mksReprint.destination[0]));
	epr_write_data(EPR_SAV_DST_Y, (uint8_t *)&mksReprint.destination[1],sizeof(mksReprint.destination[1]));
	epr_write_data(EPR_SAV_DST_Z, (uint8_t *)&mksReprint.destination[2],sizeof(mksReprint.destination[2]));
	epr_write_data(EPR_SAV_DST_E, (uint8_t *)&mksReprint.destination[3],sizeof(mksReprint.destination[3]));

        
	//������Ⱥ�ʱ��
	// Elapsed Time
	/*
	percentDone
	u8g.setPrintPos(SD_DURATION_X, 48);
	*/

	print_job_timer.getTime(&mksReprint.accumulator,&mksReprint.startTimestamp,&mksReprint.stopTimestamp);
	mksReprint.uwTick = millis();
	
	epr_write_data(EPR_SAV_ACCU, (uint8_t *)&mksReprint.accumulator,sizeof(mksReprint.accumulator));
	epr_write_data(EPR_SAV_STARTIME, (uint8_t *)&mksReprint.startTimestamp,sizeof(mksReprint.startTimestamp));
	epr_write_data(EPR_SAV_STOPTIME, (uint8_t *)&mksReprint.stopTimestamp,sizeof(mksReprint.stopTimestamp));
	epr_write_data(EPR_SAV_TICK, (uint8_t *)&mksReprint.uwTick,sizeof(mksReprint.uwTick));

	//�������
	epr_write_data(EPR_SAV_FAN, (uint8_t *)&mksReprint.fanSpeeds_0,sizeof(mksReprint.fanSpeeds_0));

	//����feedrate
	epr_write_data(EPR_SAV_F, (uint8_t *)&mksReprint.feedrate_mm_s,sizeof(mksReprint.feedrate_mm_s));

}


void mks_ReadFromEpr()        //��ͣ���ϵ�ʱ��ȡ����
{
	//��ȡ�ļ���
	epr_read_data((int)EPR_SAV_FILENAME, (uint8_t*)&mksReprint.filename[0],sizeof(mksReprint.filename));  
	//��ȡ�ļ�ƫ��
	epr_read_data((int)EPR_SAV_SDPOS, (uint8_t*)&mksReprint.sdpos, sizeof(mksReprint.sdpos));
	//��ȡ��ӡͷ�¶�
	epr_read_data((int)EPR_SAV_TARGET_TEMP_0, (uint8_t*)&mksReprint.target_temperature_0, sizeof(mksReprint.target_temperature_0));
	//��ȡ�ȴ��¶�
	if(HAS_TEMP_BED)
		{
		epr_read_data((int)EPR_SAV_TARGET_TEMP_BED, (uint8_t*)&mksReprint.target_temperature_bed, sizeof(mksReprint.target_temperature_bed));
		}
	//��ȡ��ǰλ��
	epr_read_data((int)EPR_SAV_CUR_X, (uint8_t*)&mksReprint.current_position[0], sizeof(mksReprint.current_position[0]));
	epr_read_data((int)EPR_SAV_CUR_Y, (uint8_t*)&mksReprint.current_position[1], sizeof(mksReprint.current_position[1]));
	epr_read_data((int)EPR_SAV_CUR_Z, (uint8_t*)&mksReprint.current_position[2], sizeof(mksReprint.current_position[2]));
	epr_read_data((int)EPR_SAV_CUR_E, (uint8_t*)&mksReprint.current_position[3], sizeof(mksReprint.current_position[3]));
	//��ȡĿ��λ��
	epr_read_data((int)EPR_SAV_DST_X, (uint8_t*)&mksReprint.destination[0], sizeof(mksReprint.destination[0]));
	epr_read_data((int)EPR_SAV_DST_Y, (uint8_t*)&mksReprint.destination[1], sizeof(mksReprint.destination[1]));
	epr_read_data((int)EPR_SAV_DST_Z, (uint8_t*)&mksReprint.destination[2], sizeof(mksReprint.destination[2]));
	epr_read_data((int)EPR_SAV_DST_E, (uint8_t*)&mksReprint.destination[3], sizeof(mksReprint.destination[3]));


	//��ȡ���Ⱥ�ʱ��
	epr_read_data((int)EPR_SAV_ACCU, (uint8_t*)&mksReprint.accumulator, sizeof(mksReprint.accumulator));
	epr_read_data((int)EPR_SAV_STARTIME, (uint8_t*)&mksReprint.startTimestamp, sizeof(mksReprint.startTimestamp));
	epr_read_data((int)EPR_SAV_STOPTIME, (uint8_t*)&mksReprint.stopTimestamp, sizeof(mksReprint.stopTimestamp));
	epr_read_data((int)EPR_SAV_TICK, (uint8_t*)&mksReprint.uwTick, sizeof(mksReprint.uwTick));

	//��ȡ�����ٶ�
	epr_read_data((int)EPR_SAV_FAN, (uint8_t*)&mksReprint.fanSpeeds_0, sizeof(mksReprint.fanSpeeds_0));

	//��ȡfeedrate
	epr_read_data((int)EPR_SAV_F, (uint8_t*)&mksReprint.feedrate_mm_s, sizeof(mksReprint.feedrate_mm_s));

}


void mks_resumePrint()
{
	if(mksReprint.mks_printer_state == MKS_PAUSED)
		{
		mksReprint.mks_printer_state = MKS_WORKING;
		
		//��������
		mks_preExtrude(mksReprint.mks_pausePrint_e);

		//�ƶ�X,Y

#if MKS_MOVE_SWIT	
		destination[X_AXIS] = mksReprint.destination[0];
		destination[Y_AXIS] = mksReprint.destination[1];
		do_blocking_move_to_xy(destination[X_AXIS],destination[Y_AXIS]);
#else
		mks_moveXY(mksReprint.destination[0],mksReprint.destination[1]);
#endif
		//Z���½�
#if MKS_MOVE_SWIT			
		destination[Z_AXIS] = mksReprint.destination[2];		
		do_blocking_move_to_z(destination[Z_AXIS]);
#else
		mks_moveZ(0);
#endif
		//lcd_setstatus("Resume print.");
		//lcd_setstatus(MSG_RESUME_PRINT);
		lcd_setstatus(mksReprint.filename);
		
		}
	
	if(mksReprint.mks_printer_state == MKS_REPRINTING)
		{
		mksReprint.mks_printer_state = MKS_REPRINTED;
		}
}

uint8_t cmd_id_bak=0;
uint8_t cmd_id_bak_temp=0;

#define PAUSE_BACK_BYTES    1024
volatile uint32_t cmd_length=0;
uint32_t pause_file_offset()
{
    static bool sd_comment_mode = false;
    uint16_t sd_count = 0;
    static uint16_t read_cnt=0;
    strcpy_P(command_queue_bak_end,command_queue_bak[cmd_id_bak_temp]);
    //??????????
    //sean 19.12.26
    #if 1
	    if(card.sdpos < PAUSE_BACK_BYTES)
		    card.setIndex(0);
	    else
	       card.setIndex(card.sdpos-PAUSE_BACK_BYTES);
    #else
    	       card.setIndex(card.sdpos-PAUSE_BACK_BYTES);
    #endif
    cmd_length=0;
    read_cnt=0;
    bool card_eof = card.eof();
    while ((!card_eof)&&(read_cnt<PAUSE_BACK_BYTES)) {
      const int16_t n = card.get();
      char sd_char = (char)n;
      card_eof = card.eof();
      read_cnt++;
      if (card_eof || n == -1
          || sd_char == '\n' || sd_char == '\r'
          || ((sd_char == '#' || sd_char == ':') 
          && !sd_comment_mode)){
        if (card_eof) {
            break;
        }
        //else if (n == -1) 
		//{
          //card.initsd();

          //if(card.reopenfile(curFileName))
          //{
          //  card.setIndex(card.sdpos);
          //}
          //memset(command_queue[cmd_queue_index_w],0,sizeof(command_queue[cmd_queue_index_w]));         
        //}

        sd_comment_mode = false; // for new command

        if (!sd_count) continue; // skip empty lines (and comment lines)

        command_queue[cmd_queue_index_w][sd_count] = '\0'; // terminate string
        sd_count = 0; // clear sd line buffer

        if(strcmp_P(command_queue_bak_end, command_queue[cmd_queue_index_w])==0){
            
            card.setIndex(card.sdpos-(cmd_length+1));     
            return card.sdpos;
        }
        else
        {
           memset(command_queue[cmd_queue_index_w],0,sizeof(command_queue[cmd_queue_index_w]));
           cmd_length=0;
        }
      }
      else if (sd_count >= MAX_CMD_SIZE - 1) {
        cmd_length++;
      }
      else {
        if (sd_char == ';') {sd_comment_mode = true;cmd_length++;}
        if (!sd_comment_mode) 
        {
            command_queue[cmd_queue_index_w][sd_count++] = sd_char;
            cmd_length++;
        }        
      }
    }

    
    return 0;
}


void mks_pausePrint()
{
	stepper.synchronize();

	mksReprint.current_position[0] = current_position[X_AXIS];
	mksReprint.current_position[1] = current_position[Y_AXIS];
	mksReprint.current_position[2] = current_position[Z_AXIS];
	mksReprint.current_position[3] = current_position[E_AXIS];

	mksReprint.destination[0]=destination[X_AXIS];
	mksReprint.destination[1]=destination[Y_AXIS];
	mksReprint.destination[2]=destination[Z_AXIS];
	mksReprint.destination[3]=destination[E_AXIS];

        mksReprint.fanSpeeds_0 = fanSpeeds[0];
        mksReprint.feedrate_mm_s = feedrate_mm_s;

	//E �س�
	mks_preExtrude(MKS_RETROVERSION);        
	//Z������
#if MKS_MOVE_SWIT	
	destination[Z_AXIS] += mksReprint.mks_pausePrint_z; 
	do_blocking_move_to_z(destination[Z_AXIS]);
#else
	mks_moveZ(mksReprint.mks_pausePrint_z);
#endif
    //�ƶ�X,Y
#if MKS_MOVE_SWIT	
	destination[X_AXIS] = mksReprint.mks_pausePrint_x;
	destination[Y_AXIS] = mksReprint.mks_pausePrint_y;
	do_blocking_move_to_xy(destination[X_AXIS],destination[Y_AXIS]);
#else
	mks_moveXY(mksReprint.mks_pausePrint_x,mksReprint.mks_pausePrint_y);
#endif	

	card.sdpos = pause_file_offset();

	mks_WriteToEpr();
	//lcd_setstatus("Pause print.");
	lcd_setstatus(MSG_PAUSE_PRINT);

}


void find_pause_e_pos()
{
    char *temp;
    int i=0,ixy=0;
    char buff[20];

    volatile char get_e_flg=1;
    volatile uint8_t cmd_id_temp=0;

    cmd_id_temp=cmd_id_bak_temp;
    
    while(ixy<8)
    {
        ixy++;
        if(get_e_flg==1)
        {
            temp=strchr((char*)&command_queue_bak[cmd_id_temp],'E');
            i=0;
            if(temp)
            {
                while((*(temp+1+i)!=' ')&&(*(temp+1+i)!=';')&&((*(temp+1+i)!='\r'))&&(*(temp+1+i)!='\n')&&(i<20))
                {
                    buff[i]=*(temp+1+i);
                    i++;
                }
                mksReprint.current_position[E_AXIS]=atof((char*)buff)-2;
                destination[E_AXIS]=current_position[E_AXIS]=mksReprint.current_position[E_AXIS];
                get_e_flg=0;
            }  
        }        
        if(cmd_id_temp==0)
            cmd_id_temp=7;
        else
            cmd_id_temp -= 1;

        if(get_e_flg==0)break;
      }

}

void quick_pause()
{  
    commands_in_queue=0;
    cmd_queue_index_w=0;
    cmd_queue_index_r=0;    
    
    DISABLE_STEPPER_DRIVER_INTERRUPT();

    if(cmd_id_bak==0)
     cmd_id_bak_temp = 7;
    else
     cmd_id_bak_temp = cmd_id_bak-1;
    
    while (planner.blocks_queued()) planner.discard_current_block();
    stepper.current_block = NULL;
    
    find_pause_e_pos();
    set_current_from_steppers_for_axis(ALL_AXES);
    SYNC_PLAN_POSITION_KINEMATIC();
    destination[X_AXIS]=current_position[X_AXIS];
    destination[Y_AXIS]=current_position[Y_AXIS];
    destination[Z_AXIS]=current_position[Z_AXIS];
        
    ENABLE_STEPPER_DRIVER_INTERRUPT();
    
    mksReprint.mks_printer_state = MKS_PAUSED;
	epr_write_data(EPR_SAV_FLAG, (uint8_t *)&mksReprint.mks_printer_state,sizeof(mksReprint.mks_printer_state));  //??????

	mks_pausePrint();      
}

void mks_PrintStatePolling()
{
#if 0
	if(mksReprint.mks_printer_state == MKS_PAUSING)
		{
		if( !planner.blocks_queued() &&  card.getsdpos()>MIN_FILE_PRINTED) 	//���� �ļ��� M109��M190ָ�� 
			mksReprint.waitEndMoves++;
		
		if(mksReprint.waitEndMoves > 20)
			{
			mksReprint.mks_printer_state = MKS_PAUSED;
			epr_write_data(EPR_SAV_FLAG, (uint8_t *)&mksReprint.mks_printer_state,sizeof(mksReprint.mks_printer_state));  //��ͣ��־��λ
			mksReprint.waitEndMoves = 0;
			mks_pausePrint();

			}
		}
	else
		{
			mksReprint.waitEndMoves = 0;
		}
	#else
	if(mksReprint.mks_printer_state == MKS_PAUSING)
    {
        	quick_pause();
    }	
	#endif
/*
	Cartesian���� ��ͣ��LCD �ƶ�X,Y,Z����
	DELTA ���� ��ͣ��X,Y,Z�����㣬���账��
*/
	//if(mksReprint.mks_printer_state == MKS_PAUSED && MACHINETPYE != DELTA)
	if(mksReprint.mks_printer_state == MKS_PAUSED)		
		{
		if( abs(mksReprint.current_position[0] - current_position[X_AXIS]) > 0.0001 )
			{
			mksReprint.current_position[0] = current_position[X_AXIS];
			epr_write_data(EPR_SAV_CUR_X, (uint8_t *)&mksReprint.current_position[0],sizeof(mksReprint.current_position[0]));
			}
		if( abs(mksReprint.current_position[1] - current_position[Y_AXIS]) > 0.0001 )
			{
			mksReprint.current_position[1] = current_position[Y_AXIS];
			epr_write_data(EPR_SAV_CUR_Y, (uint8_t *)&mksReprint.current_position[1],sizeof(mksReprint.current_position[1]));
			}
		if( abs(mksReprint.current_position[2] - current_position[Z_AXIS]) > 0.0001 )
			{
			mksReprint.current_position[2] = current_position[Z_AXIS];
			epr_write_data(EPR_SAV_CUR_Z, (uint8_t *)&mksReprint.current_position[2],sizeof(mksReprint.current_position[2]));
			}
		}

/*
	�ļ�������ӡ��󣬱�־λ����
*/
	if(mksReprint.mks_printer_state == MKS_WORKING)
		{
		if(card.sdprinting == 0)
			mksReprint.sdprinting++;
		else
			mksReprint.sdprinting = 0;

		if(mksReprint.sdprinting > 20)
			{
			mksReprint.sdprinting = 0;
			mksReprint.mks_printer_state = MKS_IDLE;
			epr_write_data(EPR_SAV_FLAG, (uint8_t *)&mksReprint.mks_printer_state,sizeof(mksReprint.mks_printer_state));  
			mks_clearFile();
#ifdef MKS_BUG_PRINTPAUSE
							char temp[20];
							char string[20]="pauseCnt = ";
							sprintf(temp,"%d",planner.mksBugPrintPauseCnt);
							strcat(string,temp);
							lcd_setstatus(string);
#endif

			}
		}

	//��ͣ,�ϵ�����
	if(mksReprint.mks_printer_state == MKS_REPRINTED)
		{
		switch(MACHINETPYE)
			{
			case Cartesian:
			case COREXY:
			case COREYX:	
				if(mksReprint.resume == MKS_RESUME_PAUSE)
					mks_contiuePrintPause();
				else if(mksReprint.resume == MKS_RESUME_PWDWN) 
					mks_contiuePrintPwdwn();
			break;
			case DELTA:
				mks_contiuePrintDelta();
				break;
			default: 
				break;				
			}
			
		}




	
}



void mks_setTemperature()
{
	char string[20];
	
		//�����ȴ��¶� M140
		if(HAS_TEMP_BED && mksReprint.target_temperature_bed != 0)
			{
			memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
			strcpy(mksReprint.command_queue,"M140 S");	
			//itoa(mksReprint.target_temperature_bed,string,10);
			sprintf(string,"%d",mksReprint.target_temperature_bed);
			strcat(mksReprint.command_queue,string);
			current_command_args = &mksReprint.command_queue[5];
			gcode_M140();
			}
	
	
		//���ô�ӡͷ�¶�
	if(mksReprint.target_temperature_0 != 0)
		{
			memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
		strcpy(mksReprint.command_queue,"M109 S");	
	//	itoa(mksReprint.target_temperature_0,string,10);
		sprintf(string,"%d",mksReprint.target_temperature_0);
		strcat(mksReprint.command_queue,string);
		current_command_args = &mksReprint.command_queue[5];
		gcode_M109();
		}
	
		//�����ȴ��¶�
		if(HAS_TEMP_BED && mksReprint.target_temperature_bed != 0)
			{
			memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
			strcpy(mksReprint.command_queue,"M190 S");	
			//itoa(mksReprint.target_temperature_bed,string,10);
			sprintf(string,"%d",mksReprint.target_temperature_bed);
			strcat(mksReprint.command_queue,string);
			current_command_args = &mksReprint.command_queue[5];
			gcode_M190();
			}


}

void mks_setPositionZ()
{
 	char string[20];
   
	//����Z��ǰλ��
	memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
	strcpy(mksReprint.command_queue,"G92 Z");
	memset(string,0,sizeof(string));
	sprintf(string,"%f",mksReprint.current_position[2]);
	strcat(mksReprint.command_queue,string);
	current_command_args = &mksReprint.command_queue[4];
	gcode_G92();
	soft_endstop_min[2] = 0;
}



void mks_setFeedrate( )
{
	//����feedrate
	feedrate_mm_s = mksReprint.feedrate_mm_s;
}


void mks_preExtrude(float e)
{
	//��������

	char string[20];
	relative_mode = true;

	memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
	strcpy(mksReprint.command_queue,"G1 E");
	memset(string,0,sizeof(string));
	sprintf(string,"%f",e);
	strcat(mksReprint.command_queue,string);
	current_command_args = &mksReprint.command_queue[3];
	gcode_G0_G1();
	stepper.synchronize();

	relative_mode = false;


//����E��ǰλ��
	memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
	strcpy(mksReprint.command_queue,"G92 E");
	memset(string,0,sizeof(string));
	//sprintf(string,"%f",mksReprint.current_position[3]);
	sprintf(string,"%f",mksReprint.destination[3]);	
	strcat(mksReprint.command_queue,string);
	current_command_args = &mksReprint.command_queue[4];
	gcode_G92();

}

#if MKS_MOVE_SWIT	
void mks_moveXY()
{
	//�ƶ���ӡͷX,Yλ��
	
	destination[X_AXIS] = mksReprint.destination[0];
	destination[Y_AXIS] = mksReprint.destination[1];
	do_blocking_move_to_xy(destination[X_AXIS],destination[Y_AXIS]);

}
#else
void mks_moveXY(float X,float Y)
{
      char string[20];
    //�ƶ���ӡͷX,Yλ��
	memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
	strcpy(mksReprint.command_queue,"G1 X");
	memset(string,0,sizeof(string));
	sprintf(string,"%f",X);
	strcat(mksReprint.command_queue,string);

	strcat(mksReprint.command_queue," Y");
	memset(string,0,sizeof(string));
	sprintf(string,"%f",Y);
	strcat(mksReprint.command_queue,string);
	
	current_command_args = &mksReprint.command_queue[3];
	gcode_G0_G1();
	stepper.synchronize();

}
#endif
void mks_moveZ(float Z)
{
      char string[20];
    //�ƶ���ӡͷZλ��
	memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
	strcpy(mksReprint.command_queue,"G1 Z");
	memset(string,0,sizeof(string));
	sprintf(string,"%f",mksReprint.destination[2]+Z);
	strcat(mksReprint.command_queue,string);
	current_command_args = &mksReprint.command_queue[3];
	gcode_G0_G1();
	stepper.synchronize();
}

void mks_G28(char *g_command)
{
	memset(mksReprint.command_queue,0,MAX_CMD_SIZE);
	strcpy(mksReprint.command_queue,g_command);
	current_command_args = &mksReprint.command_queue[4];
	gcode_G28();
	
	if((BED_LEVELING_METHOD & HAS_LEVELING) && (BED_LEVELING_METHOD != AUTO_BED_LEVELING_UBL))
		{
		  set_bed_leveling_enabled(true);
	#if ENABLED(ENABLE_LEVELING_FADE_HEIGHT)
		if((MACHINETPYE != DELTA) && (BED_LEVELING_METHOD&HAS_FADE))	//mks_delta
		 { if (code_seen('Z')) set_z_fade_height(code_value_linear_units());}
	#endif

                }
}

void mks_contiuePrintPause()
{
	 
	char string[20];

	card.sdprinting = true;

	mks_setTemperature();

	// X,Y����
	mks_G28("G28 X0 Y0");

	//��������
	mks_preExtrude(mksReprint.mks_pausePrint_e);

	
	//�ƶ���ӡͷX,Yλ��
#if MKS_MOVE_SWIT	
	mks_moveXY();
#else
	mks_moveXY(mksReprint.destination[0],mksReprint.destination[1]);	
#endif	
	//����Z��ǰλ��
	mks_setPositionZ();

	//�ƶ���ӡͷZλ��
	mks_moveZ(0);


	//����feedrate
	mks_setFeedrate();

	//���÷����ٶ�
	fanSpeeds[0] = mksReprint.fanSpeeds_0;
	TIM1->CCR1 = fanSpeeds[0]*10000/255;

	//lcd_setstatus("Resume printing...");
	lcd_setstatus(mksReprint.filename);
	gcode_M24(); 


}

void mks_contiuePrintPwdwn()
{
	char string[20];

	card.sdprinting = true;

	mks_setTemperature();

	//����Z��ǰλ��
	mks_setPositionZ();
	//E �س�
	mks_preExtrude(MKS_RETROVERSION);
	//�ƶ���ӡͷZλ��
	mks_moveZ(mksReprint.mks_pausePrint_z);

	// X,Y����
	mks_G28("G28 X0 Y0");

	delay(3000);
	
	//��������
	mks_preExtrude(mksReprint.mks_pausePrint_e);

	//�ƶ���ӡͷX,Yλ��
#if MKS_MOVE_SWIT	
	mks_moveXY();
#else
	mks_moveXY(mksReprint.destination[0],mksReprint.destination[1]);	
#endif
	//�ƶ���ӡͷZλ��
	mks_moveZ(0);
	
	//����feedrate
	mks_setFeedrate();

	//���÷����ٶ�
	fanSpeeds[0] = mksReprint.fanSpeeds_0;
	TIM1->CCR1 = fanSpeeds[0]*10000/255;

	//lcd_setstatus("Resume printing...");
	lcd_setstatus(mksReprint.filename);
	gcode_M24(); 
	
	mksReprint.refresh = false;
}


void mks_contiuePrintDelta()
{
	char string[20];

	card.sdprinting = true;

	mks_setTemperature();

	
	// X,Y,Z����
	mks_G28("G28");
	
	//�ƶ���ӡͷZλ��
	mks_moveZ(mksReprint.mks_pausePrint_z);

	//��������
	mks_preExtrude(mksReprint.mks_pausePrint_e);

	//�ƶ���ӡͷX,Yλ��
#if MKS_MOVE_SWIT	
	mks_moveXY();
#else
	mks_moveXY(mksReprint.destination[0],mksReprint.destination[1]);	
#endif	

	//�ƶ���ӡͷZλ��
	mks_moveZ(0);

	//����feedrate
	mks_setFeedrate();

	//���÷����ٶ�
	fanSpeeds[0] = mksReprint.fanSpeeds_0;
	TIM1->CCR1 = fanSpeeds[0]*10000/255;

	//lcd_setstatus("Resume printing...");
	lcd_setstatus(mksReprint.filename);
	gcode_M24(); 

	mksReprint.refresh = false;

}


void mks_getPositionXYZE()
{

	//�����ļ�ƫ��
	card.setIndex(mksReprint.sdpos);

	card.sdprinting = true;
	get_sdcard_commands();
	card.sdprinting = false;
	mksReprint.refresh = false;


	LOOP_XYZE(i) 
		{
		 destination[i] = current_position[i] = 0;
	 	}

	LOOP_XYZE(i) 
		{
		current_command_args = &command_queue[i][0];
		gcode_get_destination();

		LOOP_XYZE(j)
			{
			if(abs(mksReprint.destination[j])< 0.0001 && abs(destination[j]) > 0.0001)
				mksReprint.destination[j] = destination[j];
			}
		}

	mksReprint.current_position[2] = mksReprint.destination[2];
	mksReprint.current_position[3] = mksReprint.destination[3];


	LOOP_XYZE(i) 
		{
	 	destination[i] = current_position[i] = 0;
		}
	for(int i=0;i<BUFSIZE;i++)
		memset(&command_queue[i][0],0,MAX_CMD_SIZE);
	clear_command_queue();
	

}

void mks_clearDir()
{
	char *tmp_index = NULL;
	char string[30];

// ��mksReprint.filename�ַ����е�Ŀ¼����ȥ����ֻ�����ļ���
	while(1)
		{
		tmp_index = (char *)strstr(mksReprint.filename, "/");
		if(tmp_index)
			{
			strcpy(string,tmp_index+1);
			strcpy(mksReprint.filename,string);
			}
		else
			break;
		}
	
}

void mks_contiuePrint_UI()
{

	
	lcd_setstatus("Resume print?");
	
	card.openFile(mksReprint.filename, true);
	if(!card.isFileOpen())	//�������ļ�ʧ��
		{
		mksReprint.mks_printer_state = MKS_IDLE;
		epr_write_data(EPR_SAV_FLAG, (uint8_t *)&mksReprint.mks_printer_state,sizeof(mksReprint.mks_printer_state));  //

		lcd_setstatus("Resume print failed!");
		return;
		}
	
	card.sdprinting = 0;

	if(mksReprint.resume == MKS_RESUME_PWDWN) 
		mks_getPositionXYZE();
	

	//�����ļ�ƫ��
	card.setIndex(mksReprint.sdpos);
	

	//���ý��Ⱥ�ʱ��
	print_job_timer.setTime(mksReprint.accumulator,mksReprint.startTimestamp,mksReprint.stopTimestamp);
	cli();
	HAL_SetTick(mksReprint.uwTick);
	sei();
	current_position[X_AXIS] = mksReprint.current_position[0];
	current_position[Y_AXIS] = mksReprint.current_position[1];
	current_position[Z_AXIS] = mksReprint.current_position[2];
	mks_clearDir();

	
	
}

void mks_rePrintCheck()
{
	bool pft_ok = false;
	if (!card.cardOK) return; 
		
	epr_read_data((int)EPR_SAV_FLAG, (uint8_t*)&mksReprint.mks_printer_state, sizeof(mksReprint.mks_printer_state));
	if(mksReprint.mks_printer_state == MKS_PAUSED)		//��ͣ����
		{
		mksReprint.mks_printer_state = MKS_REPRINTING;
		mks_ReadFromEpr();
		if(mksReprint.sdpos > MIN_FILE_PRINTED)
			{
			mksReprint.resume = MKS_RESUME_PAUSE;
			mks_contiuePrint_UI();

			}
		else
			{
			mksReprint.mks_printer_state = MKS_IDLE;
			epr_write_data(EPR_SAV_FLAG, (uint8_t *)&mksReprint.mks_printer_state,sizeof(mksReprint.mks_printer_state));  //
			}
		}
	
	else if(mksReprint.mks_printer_state == MKS_WORKING)	//�ϵ�����
		{
		mksReprint.mks_printer_state = MKS_REPRINTING;
		//��ȡ�ļ���
		epr_read_data((int)EPR_SAV_FILENAME, (uint8_t*)&mksReprint.filename[0],sizeof(mksReprint.filename));  
		pft_ok = mks_ReadFromFile();
		if(pft_ok && mksReprint.sdpos > MIN_FILE_PRINTED )
			{
			mksReprint.resume = MKS_RESUME_PWDWN;
			mks_contiuePrint_UI();
			}
		else
			{
			mksReprint.mks_printer_state = MKS_IDLE;
			epr_write_data(EPR_SAV_FLAG, (uint8_t *)&mksReprint.mks_printer_state,sizeof(mksReprint.mks_printer_state));  //
			lcd_setstatus(WELCOME_MSG);
			
             }
		}
	
	else
		{
		mksReprint.mks_printer_state = MKS_IDLE;
		epr_write_data(EPR_SAV_FLAG, (uint8_t *)&mksReprint.mks_printer_state,sizeof(mksReprint.mks_printer_state));
		}
}


void mks_WriteToFile()
{
	char string[20];
	mksReprint.card.openFile(MKS_PFT_NAME, false);
	
	if (mksReprint.card.isFileOpen()) 
		{
		memset(string,0,sizeof(string));
		strcpy(string,"start");
		mksReprint.card.write_command(string);	//"start"

		//�����ļ�λ��
		memset(string,0,sizeof(string));
		sprintf(string,"%d",mksReprint.sdpos);
		mksReprint.card.write_command(string);
		//�����ӡͷ�¶�
		memset(string,0,sizeof(string));
		sprintf(string,"%d",thermalManager.target_temperature[0]);
		mksReprint.card.write_command(string);
		//�����ȴ��¶�
		//if(HAS_TEMP_BED)
			{
			memset(string,0,sizeof(string));
			sprintf(string,"%d",thermalManager.target_temperature_bed);
			mksReprint.card.write_command(string);
			}

		//������Ⱥ�ʱ��
		print_job_timer.getTime(&mksReprint.accumulator,&mksReprint.startTimestamp,&mksReprint.stopTimestamp);
		mksReprint.uwTick = millis();
		if(mksReprint.startTimestamp > mksReprint.stopTimestamp  ) mksReprint.stopTimestamp = mksReprint.uwTick;

		memset(string,0,sizeof(string));					//accumulator
		sprintf(string,"%d",mksReprint.accumulator);
		mksReprint.card.write_command(string);

		memset(string,0,sizeof(string));					//startTimestamp
		sprintf(string,"%d",mksReprint.startTimestamp);
	        mksReprint.card.write_command(string);

		memset(string,0,sizeof(string));					//stopTimestamp
		sprintf(string,"%d",mksReprint.stopTimestamp);
		mksReprint.card.write_command(string);

		memset(string,0,sizeof(string));					//uwTick
		sprintf(string,"%d",mksReprint.uwTick);
		mksReprint.card.write_command(string);
		

		//�������
		memset(string,0,sizeof(string));
		sprintf(string,"%d",fanSpeeds[0]);
		mksReprint.card.write_command(string);
		
		//����feedrate
		memset(string,0,sizeof(string));
		sprintf(string,"%f",feedrate_mm_s);
		mksReprint.card.write_command(string);
		


		memset(string,0,sizeof(string));
		strcpy(string,"end");						//"end"
		mksReprint.card.write_command(string);	
		
		mksReprint.card.closefile(true);
		}
	

}



bool mks_get_commands() {
	char string[20];
	char commands_count = 0;
  uint16_t sd_count = 0;
  bool card_eof = mksReprint.card.eof();
	bool end_ok = false;
  
  while (!card_eof ) 
  	{
	const int16_t n = mksReprint.card.get();
	char sd_char = (char)n;
	card_eof = mksReprint.card.eof();

	
	
	if ( sd_char == '\n') 	//"start\r\n"
		{
		string[sd_count-1] = 0;		//ȥ�� "\r"
		switch(commands_count)
			{
			case 0:			//start
				break;
			case 1:			//��ȡ�ļ�λ��
				mksReprint.sdpos = atoi(string);
				break;
			case 2:			//��ȡ��ӡͷ�¶�
				mksReprint.target_temperature_0 = atoi(string);
				break;
			case 3:			//��ȡ�ȴ��¶�
				mksReprint.target_temperature_bed = atoi(string);
				break;
			case 4:			//accumulator
				mksReprint.accumulator = atoi(string);
				break;
			case 5:			//startTimestamp
				mksReprint.startTimestamp = atoi(string);
				break;
			case 6:			//stopTimestamp
				mksReprint.stopTimestamp = atoi(string);
				break;
			case 7:			//uwTick
				mksReprint.uwTick = atoi(string);
				break;
			case 8:			//��ȡ����
				mksReprint.fanSpeeds_0 = atoi(string);
				break;
			case 9:		//��ȡfeedrate
				mksReprint.feedrate_mm_s = atof(string);
				break;
			case 10:		//end
				if(strcmp(string,"end") == 0)
					end_ok = true;
				break;
			default: break;				
				
			}

	  	sd_count = 0;
		memset(string,0,sizeof(string));
		commands_count++;
		}
	else 
		{
		  string[sd_count++] = sd_char;
		}
		
  }

  return(end_ok);
}



bool mks_ReadFromFile()
{
	bool get_ok = false;
	mksReprint.card.openFile(MKS_PFT_NAME, true);
	if (mksReprint.card.isFileOpen()) 
		{

		get_ok = mks_get_commands();

		mksReprint.card.closefile(true);
		}
	
	return(get_ok);

}

void mks_clearFile()
{
	char string[20]="clear";
	mksReprint.card.openFile(MKS_PFT_NAME, false);
	mksReprint.card.write_command(string);
	mksReprint.card.closefile(true);
}




