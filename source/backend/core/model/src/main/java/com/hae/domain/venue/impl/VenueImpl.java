/*
 * Copyright 2011 HAE Project.
 *
 */
package com.hae.domain.venue.impl;

import com.hae.domain.vendor.impl.VendorImpl;
import com.hae.domain.venue.Venue;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public class VenueImpl implements Venue {
    
    
    //Attributes
    
    /**
     * Object ID
     */
    private int id;
    
    /**
     * Venue Name
     */
    private String name;

    
    /* Vendors for the venue */
    private List<VendorImpl> vendors;
    
    
    private List<VenueSectionImpl> sections;
    
    /* Venue geofencing location */
    
    /* South West Latitude */
    private float boundsSouthWestLat;
    
    /* South West Longitude */
    private float boundsSouthWestLon;
    
    /* South East Latitude */
    private float boundsSouthEastLat;
    
    /* South East Longitude */
    private float boundsSouthEastLon;
    
    /* North West Latitude */
    private float boundsNorthWestLat;
    
    /* North West Longitude */
    private float boundsNorthWestLon;

    /* North East Latitude */
    private float boundsNorthEastLat;
    
    /* North East Longitude */
    private float boundsNorthEastLon; 
    
    
    
    
    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    public List<VendorImpl> getVendors() {
        return vendors;
    }

    public void setVendors(List<VendorImpl> vendors) {
        this.vendors = vendors;
    }

    public float getBoundsNorthEastLat() {
        return boundsNorthEastLat;
    }

    public void setBoundsNorthEastLat(float boundsNorthEastLat) {
        this.boundsNorthEastLat = boundsNorthEastLat;
    }

    public float getBoundsNorthEastLon() {
        return boundsNorthEastLon;
    }

    public void setBoundsNorthEastLon(float boundsNorthEastLon) {
        this.boundsNorthEastLon = boundsNorthEastLon;
    }

    public float getBoundsNorthWestLat() {
        return boundsNorthWestLat;
    }

    public void setBoundsNorthWestLat(float boundsNorthWestLat) {
        this.boundsNorthWestLat = boundsNorthWestLat;
    }

    public float getBoundsNorthWestLon() {
        return boundsNorthWestLon;
    }

    public void setBoundsNorthWestLon(float boundsNorthWestLon) {
        this.boundsNorthWestLon = boundsNorthWestLon;
    }

    public float getBoundsSouthEastLat() {
        return boundsSouthEastLat;
    }

    public void setBoundsSouthEastLat(float boundsSouthEastLat) {
        this.boundsSouthEastLat = boundsSouthEastLat;
    }

    public float getBoundsSouthEastLon() {
        return boundsSouthEastLon;
    }

    public void setBoundsSouthEastLon(float boundsSouthEastLon) {
        this.boundsSouthEastLon = boundsSouthEastLon;
    }

    public float getBoundsSouthWestLat() {
        return boundsSouthWestLat;
    }

    public void setBoundsSouthWestLat(float boundsSouthWestLat) {
        this.boundsSouthWestLat = boundsSouthWestLat;
    }

    public float getBoundsSouthWestLon() {
        return boundsSouthWestLon;
    }

    public void setBoundsSouthWestLon(float boundsSouthWestLon) {
        this.boundsSouthWestLon = boundsSouthWestLon;
    }

    public List<VenueSectionImpl> getSections() {
        return sections;
    }

    public void setSections(List<VenueSectionImpl> sections) {
        this.sections = sections;
    }
    
    
    
    
    
    
    
}
