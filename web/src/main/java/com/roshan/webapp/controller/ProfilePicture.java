package com.roshan.webapp.controller;


/**
 * Command class to handle uploading of a profile picture.
 * 
 * @author roshan
 *
 */
public class ProfilePicture {

    /** The picture. */
    private byte[] picture;

    /**
     * Gets the picture.
     *
     * @return the picture
     */
    public byte[] getPicture() {
        return this.picture;
    }

    /**
     * Sets the picture.
     *
     * @param picture the picture to set
     */
    public void setPicture(byte[] picture) {
        this.picture = picture;
    }


}
