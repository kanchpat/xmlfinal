<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:template match="/">
        <div class="forminput"><label for="day">Day</label>:<br/>
            <select name="day" id="day">
                <option value="" >Any Day</option>
                <option value="1" >Monday</option>
                <option value="2" >Tuesday</option>
                <option value="3" >Wednesday</option>
                <option value="4" >Thursday</option>
                <option value="5" >Friday</option>
                <option value="6" >Saturday</option>
            </select>
        </div>
    </xsl:template>
    
    <xsl:template match="text()"/>
</xsl:stylesheet>