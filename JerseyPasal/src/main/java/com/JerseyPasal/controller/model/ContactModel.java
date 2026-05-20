package com.JerseyPasal.controller.model;

// This model holds a user's contact message before it is saved or displayed.
public class ContactModel {

    private int contactId;
    private int userId;
    private String subject;
    private String message;

    public ContactModel() {
    }

    public ContactModel(int userId, String subject, String message) {
        this.userId = userId;
        this.subject = subject;
        this.message = message;
    }

    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }   

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }   

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}