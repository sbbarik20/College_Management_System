package com.example.LMS;
public class Exam{
    private String q1;
    private String q2;
    private String q3;
    private String q4;
    private String q5;
    public String getq1(){
        return q1;
    }
 
    public void setq1(String q1){
        this.q1 =q1;
    }
        public String getq2(){
            return q2;
        }
    public void setq2(String q2){
        this.q2 =q2;
    }
    public String getq3(){
        return q3;
    }
    public void setq3(String q3){
        this.q3 =q3;
    }
    public String getq4(){
        return q4;
    }
    public void setq4(String q4){
        this.q4 =q4;
    }
    public String getq5(){
        return q5;
    }
    public void setq5(String q5){
        this.q5 =q5;
    }
    @Override
    public String toString(){
        return "{\"q1\": "+q1+", \"q2\": "+q2+",\"q3\":"+q3+",\"q4\":"+q4+",\"q5\":"+q5+"}";
    }
    public String[] getAnsArray(){
        String[] arr={null,q1,q2,q3,q4,q5};
        return arr;
    }

}