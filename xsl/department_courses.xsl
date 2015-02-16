<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">

  <xsl:import href="common.xsl"/>

  <xsl:template match="/">

    <xsl:variable name="deptShortName"
      select="//course[department/@code=$deptcode][1]/department/dept_short_name"/>
    <xsl:variable name="deptLongName"
      select="//course[department/@code=$deptcode][1]/department/dept_long_name"/>

    <xsl:call-template name="groupBySelection"/>

    <xsl:call-template name="breadcrumb"/>



    <!-- EXPORT TO PDF LINK -->
    <div>
      <div class="right">

        <xsl:if test="$groupby=''">
          <p class="link"><a href="#" 
            onclick="exportToPDF('{$deptcode}','1', 'group', '', '', '{$deptShortName}', '{$deptLongName}');"
              ><img src="web/images/pdf.png" width="28px" height="30px"/> Export to PDF</a>
          </p>
        </xsl:if>

        <xsl:if test="$groupby='term'">
          <p class="link"><a href="#"
            onclick="exportToPDF('{$deptcode}','2', 'group', '', '', '{$deptShortName}', '{$deptLongName}');"
              ><img src="web/images/pdf.png" width="28px" height="30px"/> Export to PDF</a>
        </p>
        </xsl:if>

        <xsl:if test="$groupby='dandt'">
          <p class="link">
          <a href="#"
            onclick="exportToPDF('{$deptcode}','3', 'group', '', '','{$deptShortName}', '{$deptLongName}');"
              ><img src="web/images/pdf.png" width="28px" height="30px"/> Export to PDF</a>
        </p>
        </xsl:if>

        <xsl:if test="$groupby='instructor'">
          <p class="link">
          <a href="#"
            onclick="exportToPDF('{$deptcode}','4', 'group','', '', '{$deptShortName}', '{$deptLongName}');"
              ><img src="web/images/pdf.png" width="28px" height="30px"/> Export to PDF</a>
            </p>
        </xsl:if>


      </div>

      <!-- DEPARTMENT NAME HEADER -->
      <p>
        <h2>
          <xsl:value-of select="//course[department/@code=$deptcode][1]/department/dept_short_name"
          />
        </h2>
      </p>
      <p/>

    </div>



    <!-- COURSE GROUP ANCHOR MENU -->
    <!-- show course group anchor menu, if there are more than one course groups -->
    <xsl:if
      test="count(distinct-values(descendant-or-self::course/department[@code=$deptcode]/parent::course/course_group/@code)) > 1">
      <div class="cgAnch">
        <xsl:for-each-group
          select="descendant-or-self::course/department[@code=$deptcode]/parent::course/course_group"
          group-by="text()">
          <xsl:sort select="text()"/>
          <a>
            <xsl:attribute name="href">#<xsl:value-of select="encode-for-uri(@code)"
              /></xsl:attribute>
            <xsl:value-of select="text()"/>
          </a>
          <xsl:if test="position() != last()"> | </xsl:if>
        </xsl:for-each-group>
      </div>

    </xsl:if>


    <div class="accord-container">

      <!-- COURSE GROUP HEADER -->
      <xsl:for-each-group select="//course/department[@code=$deptcode]/parent::course/course_group"
        group-by="@code">
        <xsl:sort select="./text()"/>

        <p id="groupby"/>


        <!-- show sub header if there are more than one course groups -->
        <xsl:if
          test="count(distinct-values(//course/department[@code=$deptcode]/parent::course/course_group/@code)) >= 1">

          <p class="group-heading">

            <a class="plain">
              <xsl:attribute name="name">
                <xsl:value-of select="./@code"/>
              </xsl:attribute>
              <xsl:value-of select="./text()"/>
            </a>

            <img style="float : right;" src="web/images/expand.png" alt=""/>

          </p>

        </xsl:if>
        

        <xsl:choose>

          <xsl:when test="$groupby=''">

            <div class="accord-content">

              <table class="details">
                <tr class="detailsHeader">
                  <th>Number</th>
                  <th>Term</th>
                  <th>Title</th>
                </tr>

                <xsl:apply-templates select="current-group()"/>
              </table>

            </div>


          </xsl:when>

          <xsl:when test="$groupby='term'">

            <div class="accord-content">

              <xsl:for-each-group select="current-group()/parent::course/term"
                group-by="@term_pattern_code">
                <xsl:sort select="./text()"/>



                <xsl:choose>
                  <xsl:when test="current-grouping-key()=1">
                    <p class="accord-heading indented-less" id="grpType">Term : FALL TERM <img
                        style="float : right;" src="web/images/expand.png" alt=""/>
                    </p>
                  </xsl:when>
                  <xsl:when test="current-grouping-key()=2">
                    <p class="accord-heading indented-less" id="grpType">Term : SPRING TERM <img
                        style="float : right;" src="web/images/expand.png" alt=""/></p>
                  </xsl:when>
                  <xsl:when test="current-grouping-key()=3">
                    <p class="accord-heading indented-less" id="grpType">Term : FALL TERM AND
                      REPEATED SPRING TERM <img style="float : right;" src="web/images/expand.png"
                        alt=""/></p>
                  </xsl:when>
                  <xsl:when test="current-grouping-key()=4">
                    <p class="accord-heading indented-less" id="grpType">Term : FULL YEAR <img
                        style="float : right;" src="web/images/expand.png" alt=""/></p>
                  </xsl:when>
                </xsl:choose>

                <div class="accord-content">

                  <table class="details">
                    <tr class="detailsHeader">
                      <th>Number</th>
                      <th>Term</th>
                      <th>Title</th>
                    </tr>



                    <xsl:apply-templates
                      select="current-group()/parent::course/term[@term_pattern_code=current-grouping-key()]/parent::course/course_group"/>

                  </table>

                </div>


              </xsl:for-each-group>

            </div>

          </xsl:when>

          <xsl:when test="$groupby='instructor'">

            <div class="accord-content">

              <xsl:choose>
                <xsl:when
                  test="count(distinct-values(current-group()/parent::course/faculty_text)) > 1">

                  <xsl:for-each-group select="current-group()/parent::course/faculty_text"
                    group-by="./text()">
                    <xsl:sort select="./text()"/>

                    <p id="grpType" class="accord-heading less-indented">Instructor : <xsl:value-of
                        select="current-grouping-key()"/><img style="float : right;"
                        src="web/images/expand.png" alt=""/></p>

                    <div class="accord-content">

                      <table class="details">
                        <tr class="detailsHeader">
                          <th>Number</th>
                          <th>Term</th>
                          <th>Title</th>
                        </tr>

                        <xsl:apply-templates select="current-group()/parent::course/course_group"/>

                      </table>
                    </div>

                  </xsl:for-each-group>

                </xsl:when>

                <xsl:when
                  test="count(distinct-values(current-group()/parent::course/faculty_text))&lt;=1">

                  <xsl:if test="distinct-values(current-group()/parent::course/faculty_text)=''">
                    <p id="grpType" class="accord-heading less-indented">Instructor :
                      Information not available<img style="float : right;"
                        src="web/images/expand.png" alt=""/></p>
                  </xsl:if>
                  
                  
                  <xsl:if test="distinct-values(current-group()/parent::course/faculty_text)!=''">
                    <p id="grpType" class="accord-heading less-indented">Instructor :
                      <xsl:value-of select="distinct-values(current-group()/parent::course/faculty_text)"/><img style="float : right;"
                        src="web/images/expand.png" alt=""/></p>
                  </xsl:if>
                  
                  
                  <div class="accord-content">

                    <table class="details">
                      <tr class="detailsHeader">
                        <th>Number</th>
                        <th>Term</th>
                        <th>Title</th>
                      </tr>

                      <xsl:apply-templates select="current-group()/parent::course/course_group"/>

                    </table>

                  </div>


                </xsl:when>
              </xsl:choose>
            </div>
          </xsl:when>

          <xsl:when test="$groupby='dandt'">

            <div class="accord-content">

              <xsl:choose>
                <xsl:when
                  test="count(distinct-values(current-group()/parent::course/meeting_text)) > 1">

                <xsl:for-each-group select="current-group()/parent::course/meeting_text"
                    group-by="./text()">
                    <xsl:sort select="./text()"/>

                    <p id="grpType" class="accord-heading less-indented">Meeting Time :
                        <xsl:value-of select="current-grouping-key()"/><img style="float : right;"
                        src="web/images/expand.png" alt=""/></p>


                    <div class="accord-content">

                      <table class="details">
                        <tr class="detailsHeader">
                          <th>Number</th>
                          <th>Term</th>
                          <th>Title</th>
                        </tr>

                        <xsl:apply-templates select="current-group()/parent::course/course_group"/>

                      </table>

                    </div>

                  </xsl:for-each-group>


                </xsl:when>

                <xsl:when
                  test="count(distinct-values(current-group()/parent::course/meeting_text))&lt;=1">

                  <xsl:if test="distinct-values(current-group()/parent::course/meeting_text)=''">
                    <p id="grpType" class="accord-heading less-indented">Meeting Time :
                     Time not available<img style="float : right;"
                        src="web/images/expand.png" alt=""/></p>
                  </xsl:if>
                  
                  
                  <xsl:if test="distinct-values(current-group()/parent::course/meeting_text)!=''">
                    <p id="grpType" class="accord-heading less-indented">Meeting Time :
                      <xsl:value-of select="distinct-values(current-group()/parent::course/meeting_text)"/><img style="float : right;"
                        src="web/images/expand.png" alt=""/></p>
                  </xsl:if>
                               
                  
                  <div class="accord-content">
                    
                    <table class="details">
                      <tr class="detailsHeader">
                        <th>Number</th>
                        <th>Term</th>
                        <th>Title</th>
                      </tr>

                      <xsl:apply-templates select="current-group()/parent::course/course_group"/>

                    </table>
                  </div>


                </xsl:when>
                
              </xsl:choose>

            </div>
          </xsl:when>
        </xsl:choose>



      </xsl:for-each-group>
    </div>
  </xsl:template>



  <!-- COURSES GRID -->
  <xsl:template match="course_group">

    <tr>
      <xsl:if test="position() mod 2=0">
        <xsl:attribute name="class">detailsEven</xsl:attribute>
      </xsl:if>
      <xsl:if test="position() mod 2!=0">
        <xsl:attribute name="class">detailsOdd</xsl:attribute>
      </xsl:if>

      <!-- COURSE NAME AND NUMBER -->
      <td class="details">
        <a id="trigger" alt="{$deptcode}|{./parent::course/@cat_num}"
          onmouseout="onCourseUnHover();return false;"
          onmouseover="onCourseHover('{$deptcode}','{./parent::course/@cat_num}');return false;"
          href="#" onclick="loadCourseDetails('{$deptcode}','{./parent::course/@cat_num}');">
          <xsl:value-of select="./parent::course/course_group/text()"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="./parent::course/course_number/num_int/text()"/>
          <xsl:value-of select="./parent::course/course_number/num_char/text()"/>
        </a>
      </td>

      <!-- COURSE TERM -->
      <td class="details">
        <xsl:value-of select="./parent::course/term/text()"/>
      </td>

      <!-- COURSE TITLE -->
      <td class="details">
        <a id="trigger" href="#" alt="{$deptcode}|{./parent::course/@cat_num}"
          onmouseout="onCourseUnHover();return false;"
          onmouseover="onCourseHover('{$deptcode}','{./parent::course/@cat_num}');return false;"
          onclick="loadCourseDetails('{$deptcode}','{./parent::course/@cat_num}');">
          <xsl:choose>
            <!-- if course is not offered this year, surround with []s -->
            <xsl:when test="./parent::course/@offered='N'"> [ <xsl:if
                test="./parent::course/instructor_approval_required/text()='Y'">*</xsl:if>
              <xsl:value-of select="./parent::course/title/text()"/> ] </xsl:when>
            <xsl:otherwise>
              <xsl:if test="./parent::course/instructor_approval_required/text()='Y'">*</xsl:if>
              <xsl:value-of select="./parent::course/title/text()"/>
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </td>
    </tr>

  </xsl:template>



  <xsl:template match="text()"/>
</xsl:stylesheet>
