/*
 * Copyright 2012 HAE Project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.hae.domain.venue.impl;

import com.hae.domain.venue.Concession;
import com.hae.domain.venue.Venue;
import com.hae.domain.venue.VenueSection;
import java.util.List;


/**
 *
 * @author Chris Purtell
 */
public class VenueSectionImpl implements VenueSection {

    
    /* Object ID */
    private long id;
    
    /* Venue the section belongs to */
    private Venue venue;
    
    /* Section number */
    private String section_id;
    
    /* Avaliable Concessions */
    private List<Concession> concessions;
    
    
    /* Geo fencing */
    
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

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public List<Concession> getConcessions() {
        return concessions;
    }

    @Override
    public void setConcessions(List<Concession> concessions) {
        this.concessions = concessions;
    }

    @Override
    public String getSection_id() {
        return section_id;
    }

    @Override
    public void setSection_id(String section_id) {
        this.section_id = section_id;
    }


    @Override
    public Venue getVenue() {
        return venue;
    }

    @Override
    public void setVenue(Venue venue) {
        this.venue = venue;
    }

    
    
}
