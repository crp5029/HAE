/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.ui.tests.userAthenticationTest;

import com.hae.domain.authentication.User;
import javax.servlet.http.HttpServletResponse;
import com.hae.domain.authentication.impl.UserImpl;
import com.hae.ui.rest.controllers.admin.tool.login.client.LoginControllerClient;
import com.hae.ui.tests.BaseTest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import org.junit.*;

/**
 *
 * @author chrispurtell
 */
public class UserAuthenticationTest extends BaseTest {
    

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
   
    
    @Test
    public void testUserAuthentication() {
    
        LoginControllerClient aClient = new LoginControllerClient();
        UserImpl user = new UserImpl();
        user.setUserid("fsadmin");
        user.setPassword("test123");
        HttpServletResponse response = new HttpServletResponse() {

            @Override
            public void addCookie(Cookie cookie) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public boolean containsHeader(String string) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public String encodeURL(String string) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public String encodeRedirectURL(String string) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public String encodeUrl(String string) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public String encodeRedirectUrl(String string) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void sendError(int i, String string) throws IOException {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void sendError(int i) throws IOException {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void sendRedirect(String string) throws IOException {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setDateHeader(String string, long l) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void addDateHeader(String string, long l) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setHeader(String string, String string1) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void addHeader(String string, String string1) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setIntHeader(String string, int i) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void addIntHeader(String string, int i) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setStatus(int i) {
               // throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setStatus(int i, String string) {
                //throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public String getCharacterEncoding() {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public String getContentType() {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public ServletOutputStream getOutputStream() throws IOException {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public PrintWriter getWriter() throws IOException {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setCharacterEncoding(String string) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setContentLength(int i) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setContentType(String string) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setBufferSize(int i) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public int getBufferSize() {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void flushBuffer() throws IOException {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void resetBuffer() {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public boolean isCommitted() {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void reset() {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public void setLocale(Locale locale) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            @Override
            public Locale getLocale() {
                throw new UnsupportedOperationException("Not supported yet.");
            }
        };
        aClient.authenticateUser(user, response);
        
        //Assert.assertNotNull("User Object is Null", aUser);
        
    
    }
}
