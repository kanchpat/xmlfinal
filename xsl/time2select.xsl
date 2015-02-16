<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:template match="/">        
        <div class="forminput"><label for="time">Start Time</label>:<br/>            
            <select name="time" id="time">            
                <option value="0" >select</option>
                <option value="1" >9-11 am</option>
                <option value="2" >noon-4:30 pm</option>
                <option value="3" >5:30 pm</option>
                <option value="4" >6 pm</option>
                <option value="5" >7:35 and 7:45 pm</option>                
            </select>
        </div>
    </xsl:template>
</xsl:stylesheet>