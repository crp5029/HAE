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
package spring.json.support;

import java.io.*;
import java.util.Map;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.*;
import org.codehaus.jackson.xc.JaxbAnnotationIntrospector;
import org.springframework.beans.factory.InitializingBean;

/**
 * <p> A custom extension of the Jackson ObjectMapper that unwraps a Map object
 * if the map contains only a single entry. The unwrapping support allows the
 * endpoint to return a model as a map but no have an extra Map wrapper object
 * in the generated JSON. </p> <p> This class also implements the Spring
 * InitializingBean interface to register the JAXB annotation inspector and a
 * custom serializer type. </p>
 *
 * @author mpilone
 */
public class MapUnwrappingObjectMapper extends ObjectMapper implements
        InitializingBean {

    /**
     * Implementation of a JSON serializer that generates an empty object. This
     * class is currently needed because Jackson's default BeanSerializer
     * requires that an object have at least one property to be eligable for
     * serialization but some of the JAXB objects to be serialized will be
     * empty. The Jackson developers have indicated that this feature may be
     * supported natively in the future.
     *
     * @author mpilone
     *
     */
    public static class EmptyJaxbTypeSerializer extends JsonSerializer<Object> {
        /*
         * (non-Javadoc)
         *
         * @see
         * org.codehaus.jackson.map.JsonSerializer#serialize(java.lang.Object,
         * org.codehaus.jackson.JsonGenerator,
         * org.codehaus.jackson.map.SerializerProvider)
         */

        @Override
        public void serialize(Object value, JsonGenerator jgen,
                SerializerProvider provider) throws IOException,
                JsonProcessingException {
            // Simply write an empty object
            jgen.writeStartObject();
            jgen.writeEndObject();
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
     */
    @Override
    public void afterPropertiesSet() throws Exception {
        // Create a custom serializer factory to handle empty response objects.
        //CustomSerializerFactory serFactory = new CustomSerializerFactory();
        //serFactory.addSpecificMapping(SaveWeatherUpdateResponse.class,
        //    new EmptyJaxbTypeSerializer());
        //setSerializerFactory(serFactory);

        // Enable JAXB annotation support in Jackson
        AnnotationIntrospector introspector = new JaxbAnnotationIntrospector();
        getDeserializationConfig().setAnnotationIntrospector(introspector);
        getSerializationConfig().setAnnotationIntrospector(introspector);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.codehaus.jackson.map.ObjectMapper#readValue(java.io.InputStream,
     * java.lang.Class)
     */
    @Override
    public <T> T readValue(InputStream src, Class<T> valueType)
            throws JsonMappingException, JsonParseException, IOException {
        return super.readValue(src, valueType);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.codehaus.jackson.map.ObjectMapper#writeValue(java.io.File,
     * java.lang.Object)
     */
    @Override
    public void writeValue(File resultFile, Object value) throws IOException,
            JsonGenerationException, JsonMappingException {
        value = unwrapMap(value);
        super.writeValue(resultFile, value);
    }

    /*
     * (non-Javadoc)
     *
     * @seeorg.codehaus.jackson.map.ObjectMapper#writeValue(org.codehaus.jackson.
     * JsonGenerator, java.lang.Object)
     */
    @Override
    public void writeValue(JsonGenerator jgen, Object value) throws IOException,
            JsonGenerationException, JsonMappingException {
        value = unwrapMap(value);
        super.writeValue(jgen, value);
    }

    /*
     * (non-Javadoc)
     *
     * @seeorg.codehaus.jackson.map.ObjectMapper#writeValue(org.codehaus.jackson.
     * JsonGenerator, java.lang.Object,
     * org.codehaus.jackson.map.SerializationConfig)
     */
    @Override
    public void writeValue(JsonGenerator jgen, Object value,
            SerializationConfig config) throws IOException, JsonGenerationException,
            JsonMappingException {
        value = unwrapMap(value);
        super.writeValue(jgen, value, config);
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * org.codehaus.jackson.map.ObjectMapper#writeValue(java.io.OutputStream,
     * java.lang.Object)
     */
    @Override
    public void writeValue(OutputStream out, Object value) throws IOException,
            JsonGenerationException, JsonMappingException {
        value = unwrapMap(value);
        super.writeValue(out, value);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.codehaus.jackson.map.ObjectMapper#writeValue(java.io.Writer,
     * java.lang.Object)
     */
    @Override
    public void writeValue(Writer w, Object value) throws IOException,
            JsonGenerationException, JsonMappingException {
        value = unwrapMap(value);
        super.writeValue(w, value);
    }

    /**
     * Unwraps the given value if it implements the Map interface and contains
     * only a single entry. Otherwise the value is returned unmodified.
     *
     * @param value the potential Map to unwrap
     * @return the unwrapped map or the original value
     */
    private Object unwrapMap(Object value) {
        if (value instanceof Map) {
            Map<?, ?> map = (Map<?, ?>) value;
            if (map.size() == 1) {
                return map.values().iterator().next();
            }
        }

        return value;
    }
}
