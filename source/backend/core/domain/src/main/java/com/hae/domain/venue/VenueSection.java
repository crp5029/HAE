/*
 * Copyright 2012 Fassserve Project.
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

package com.hae.domain.venue;

import com.hae.domain.FSDomain;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public interface VenueSection extends FSDomain {

    
    public long getId();
    public void setId(long id);
    public List<Concession> getConcessions();
    public void setConcessions(List<Concession> concessions);
    public String getSection_id();
    public void setSection_id(String section_id);
    public Venue getVenue();
    public void setVenue(Venue venue);
    
    
    
}
