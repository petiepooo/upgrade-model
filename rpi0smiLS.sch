<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.3.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="rpi_hat">
<description>&lt;h1&gt;Raspberry Pi HAT&lt;/h1&gt;
by &lt;i&gt;chris@hobbyelektronik.org&lt;/i&gt;
&lt;br /&gt;
Version 0.1
&lt;br /&gt;
based on the official Raspberry Pi HAT specification from https://github.com/raspberrypi/hats with small deviations.
&lt;br /&gt;
interfaces tested so far: Power, UART, ID-I2C</description>
<packages>
<package name="RPI_3BP_THT">
<wire x1="-32.5" y1="-49.5" x2="-32.5" y2="-34" width="0" layer="20"/>
<wire x1="-32.5" y1="-34" x2="-31.5" y2="-33" width="0" layer="20" curve="-90"/>
<wire x1="-31.5" y1="-33" x2="-28.5" y2="-33" width="0" layer="20"/>
<wire x1="-32.5" y1="-49.5" x2="-29.5" y2="-52.5" width="0" layer="20" curve="90"/>
<wire x1="-29.5" y1="-52.5" x2="29.5" y2="-52.5" width="0" layer="20"/>
<wire x1="29.5" y1="-52.5" x2="32.5" y2="-49.5" width="0" layer="20" curve="90"/>
<wire x1="32.5" y1="-49.5" x2="32.5" y2="0.5" width="0" layer="20"/>
<wire x1="32.5" y1="0.5" x2="29.5" y2="3.5" width="0" layer="20" curve="90"/>
<wire x1="29.5" y1="3.5" x2="-29.5" y2="3.5" width="0" layer="20"/>
<wire x1="-29.5" y1="3.5" x2="-32.5" y2="0.5" width="0" layer="20" curve="90"/>
<wire x1="-28.5" y1="-33" x2="-27.5" y2="-32" width="0" layer="20" curve="90"/>
<wire x1="-27.5" y1="-32" x2="-27.5" y2="-17" width="0" layer="20"/>
<wire x1="-27.5" y1="-17" x2="-28.5" y2="-16" width="0" layer="20" curve="90"/>
<wire x1="-28.5" y1="-16" x2="-31.5" y2="-16" width="0" layer="20"/>
<wire x1="-31.5" y1="-16" x2="-32.5" y2="-15" width="0" layer="20" curve="-90"/>
<wire x1="-32.5" y1="-15" x2="-32.5" y2="0.5" width="0" layer="20"/>
<hole x="-29" y="0" drill="2.75"/>
<circle x="-29" y="0" radius="3" width="0" layer="29"/>
<circle x="-29" y="0" radius="3" width="0" layer="30"/>
<circle x="-29" y="0" radius="3" width="0" layer="41"/>
<circle x="-29" y="0" radius="3" width="0" layer="42"/>
<hole x="-29" y="-49" drill="2.75"/>
<circle x="-29" y="-49" radius="3" width="0" layer="29"/>
<circle x="-29" y="-49" radius="3" width="0" layer="30"/>
<circle x="-29" y="-49" radius="3" width="0" layer="41"/>
<circle x="-29" y="-49" radius="3" width="0" layer="42"/>
<hole x="29" y="0" drill="2.75"/>
<circle x="29" y="0" radius="3" width="0" layer="29"/>
<circle x="29" y="0" radius="3" width="0" layer="30"/>
<circle x="29" y="0" radius="3" width="0" layer="41"/>
<circle x="29" y="0" radius="3" width="0" layer="42"/>
<hole x="29" y="-49" drill="2.75"/>
<circle x="29" y="-49" radius="3" width="0" layer="29"/>
<circle x="29" y="-49" radius="3" width="0" layer="30"/>
<circle x="29" y="-49" radius="3" width="0" layer="41"/>
<circle x="29" y="-49" radius="3" width="0" layer="42"/>
<wire x1="13.5" y1="-33.75" x2="13.5" y2="-48.75" width="0" layer="20"/>
<wire x1="13.5" y1="-48.75" x2="12.5" y2="-49.75" width="0" layer="20" curve="-90"/>
<wire x1="12.5" y1="-49.75" x2="11.5" y2="-48.75" width="0" layer="20" curve="-90"/>
<wire x1="11.5" y1="-48.75" x2="11.5" y2="-33.75" width="0" layer="20"/>
<wire x1="11.5" y1="-33.75" x2="12.5" y2="-32.75" width="0" layer="20" curve="-90"/>
<wire x1="12.5" y1="-32.75" x2="13.5" y2="-33.75" width="0" layer="20" curve="-90"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" shape="square"/>
<pad name="2" x="-24.13" y="1.27" drill="1"/>
<pad name="3" x="-21.59" y="-1.27" drill="1"/>
<pad name="4" x="-21.59" y="1.27" drill="1"/>
<pad name="5" x="-19.05" y="-1.27" drill="1"/>
<pad name="6" x="-19.05" y="1.27" drill="1"/>
<pad name="7" x="-16.51" y="-1.27" drill="1"/>
<pad name="8" x="-16.51" y="1.27" drill="1"/>
<pad name="9" x="-13.97" y="-1.27" drill="1"/>
<pad name="10" x="-13.97" y="1.27" drill="1"/>
<pad name="11" x="-11.43" y="-1.27" drill="1"/>
<pad name="12" x="-11.43" y="1.27" drill="1"/>
<pad name="13" x="-8.89" y="-1.27" drill="1"/>
<pad name="14" x="-8.89" y="1.27" drill="1"/>
<pad name="15" x="-6.35" y="-1.27" drill="1"/>
<pad name="16" x="-6.35" y="1.27" drill="1"/>
<pad name="17" x="-3.81" y="-1.27" drill="1"/>
<pad name="18" x="-3.81" y="1.27" drill="1"/>
<pad name="19" x="-1.27" y="-1.27" drill="1"/>
<pad name="20" x="-1.27" y="1.27" drill="1"/>
<pad name="21" x="1.27" y="-1.27" drill="1"/>
<pad name="22" x="1.27" y="1.27" drill="1"/>
<pad name="23" x="3.81" y="-1.27" drill="1"/>
<pad name="24" x="3.81" y="1.27" drill="1"/>
<pad name="25" x="6.35" y="-1.27" drill="1"/>
<pad name="26" x="6.35" y="1.27" drill="1"/>
<pad name="27" x="8.89" y="-1.27" drill="1"/>
<pad name="28" x="8.89" y="1.27" drill="1"/>
<pad name="29" x="11.43" y="-1.27" drill="1"/>
<pad name="30" x="11.43" y="1.27" drill="1"/>
<pad name="31" x="13.97" y="-1.27" drill="1"/>
<pad name="32" x="13.97" y="1.27" drill="1"/>
<pad name="33" x="16.51" y="-1.27" drill="1"/>
<pad name="34" x="16.51" y="1.27" drill="1"/>
<pad name="35" x="19.05" y="-1.27" drill="1"/>
<pad name="36" x="19.05" y="1.27" drill="1"/>
<pad name="37" x="21.59" y="-1.27" drill="1"/>
<pad name="38" x="21.59" y="1.27" drill="1"/>
<pad name="39" x="24.13" y="-1.27" drill="1"/>
<pad name="40" x="24.13" y="1.27" drill="1"/>
<wire x1="-25.4" y1="2.54" x2="-25.4" y2="0" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="-2.54" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-22.86" y1="-2.54" x2="25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="-2.54" x2="25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="2.54" x2="-25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-22.86" y2="0" width="0.127" layer="22"/>
<wire x1="-22.86" y1="0" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
</package>
<package name="RPI_ZERO_THT">
<wire x1="-32.5" y1="-24" x2="-29.5" y2="-27" width="0" layer="20" curve="90"/>
<wire x1="-29.5" y1="-27" x2="29.5" y2="-27" width="0" layer="20"/>
<wire x1="29.5" y1="-27" x2="32.5" y2="-24" width="0" layer="20" curve="90"/>
<wire x1="32.5" y1="-24" x2="32.5" y2="0.5" width="0" layer="20"/>
<wire x1="32.5" y1="0.5" x2="29.5" y2="3.5" width="0" layer="20" curve="90"/>
<wire x1="29.5" y1="3.5" x2="-29.5" y2="3.5" width="0" layer="20"/>
<wire x1="-29.5" y1="3.5" x2="-32.5" y2="0.5" width="0" layer="20" curve="90"/>
<wire x1="-32.5" y1="-24" x2="-32.5" y2="0.5" width="0" layer="20"/>
<hole x="-29" y="0" drill="2.75"/>
<circle x="-29" y="0" radius="3" width="0" layer="29"/>
<circle x="-29" y="0" radius="3" width="0" layer="30"/>
<circle x="-29" y="0" radius="3" width="0" layer="41"/>
<circle x="-29" y="0" radius="3" width="0" layer="42"/>
<hole x="-29" y="-23.5" drill="2.75"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="29"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="30"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="41"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="42"/>
<hole x="29" y="0" drill="2.75"/>
<circle x="29" y="0" radius="3" width="0" layer="29"/>
<circle x="29" y="0" radius="3" width="0" layer="30"/>
<circle x="29" y="0" radius="3" width="0" layer="41"/>
<circle x="29" y="0" radius="3" width="0" layer="42"/>
<hole x="29" y="-23.5" drill="2.75"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="29"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="30"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="41"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="42"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" shape="square"/>
<pad name="2" x="-24.13" y="1.27" drill="1"/>
<pad name="3" x="-21.59" y="-1.27" drill="1"/>
<pad name="4" x="-21.59" y="1.27" drill="1"/>
<pad name="5" x="-19.05" y="-1.27" drill="1"/>
<pad name="6" x="-19.05" y="1.27" drill="1"/>
<pad name="7" x="-16.51" y="-1.27" drill="1"/>
<pad name="8" x="-16.51" y="1.27" drill="1"/>
<pad name="9" x="-13.97" y="-1.27" drill="1"/>
<pad name="10" x="-13.97" y="1.27" drill="1"/>
<pad name="11" x="-11.43" y="-1.27" drill="1"/>
<pad name="12" x="-11.43" y="1.27" drill="1"/>
<pad name="13" x="-8.89" y="-1.27" drill="1"/>
<pad name="14" x="-8.89" y="1.27" drill="1"/>
<pad name="15" x="-6.35" y="-1.27" drill="1"/>
<pad name="16" x="-6.35" y="1.27" drill="1"/>
<pad name="17" x="-3.81" y="-1.27" drill="1"/>
<pad name="18" x="-3.81" y="1.27" drill="1"/>
<pad name="19" x="-1.27" y="-1.27" drill="1"/>
<pad name="20" x="-1.27" y="1.27" drill="1"/>
<pad name="21" x="1.27" y="-1.27" drill="1"/>
<pad name="22" x="1.27" y="1.27" drill="1"/>
<pad name="23" x="3.81" y="-1.27" drill="1"/>
<pad name="24" x="3.81" y="1.27" drill="1"/>
<pad name="25" x="6.35" y="-1.27" drill="1"/>
<pad name="26" x="6.35" y="1.27" drill="1"/>
<pad name="27" x="8.89" y="-1.27" drill="1"/>
<pad name="28" x="8.89" y="1.27" drill="1"/>
<pad name="29" x="11.43" y="-1.27" drill="1"/>
<pad name="30" x="11.43" y="1.27" drill="1"/>
<pad name="31" x="13.97" y="-1.27" drill="1"/>
<pad name="32" x="13.97" y="1.27" drill="1"/>
<pad name="33" x="16.51" y="-1.27" drill="1"/>
<pad name="34" x="16.51" y="1.27" drill="1"/>
<pad name="35" x="19.05" y="-1.27" drill="1"/>
<pad name="36" x="19.05" y="1.27" drill="1"/>
<pad name="37" x="21.59" y="-1.27" drill="1"/>
<pad name="38" x="21.59" y="1.27" drill="1"/>
<pad name="39" x="24.13" y="-1.27" drill="1"/>
<pad name="40" x="24.13" y="1.27" drill="1"/>
<wire x1="-25.4" y1="2.54" x2="-25.4" y2="0" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="-2.54" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-22.86" y1="-2.54" x2="25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="-2.54" x2="25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="2.54" x2="-25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-22.86" y2="0" width="0.127" layer="22"/>
<wire x1="-22.86" y1="0" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
</package>
<package name="RPI_3BP_THT_NFH">
<wire x1="-32.5" y1="-49.5" x2="-29.5" y2="-52.5" width="0" layer="20" curve="90"/>
<wire x1="-29.5" y1="-52.5" x2="29.5" y2="-52.5" width="0" layer="20"/>
<wire x1="29.5" y1="-52.5" x2="32.5" y2="-49.5" width="0" layer="20" curve="90"/>
<wire x1="32.5" y1="-49.5" x2="32.5" y2="0.5" width="0" layer="20"/>
<wire x1="32.5" y1="0.5" x2="29.5" y2="3.5" width="0" layer="20" curve="90"/>
<wire x1="29.5" y1="3.5" x2="-29.5" y2="3.5" width="0" layer="20"/>
<wire x1="-29.5" y1="3.5" x2="-32.5" y2="0.5" width="0" layer="20" curve="90"/>
<wire x1="-32.5" y1="-49.5" x2="-32.5" y2="0.5" width="0" layer="20"/>
<hole x="-29" y="0" drill="2.75"/>
<circle x="-29" y="0" radius="3" width="0" layer="29"/>
<circle x="-29" y="0" radius="3" width="0" layer="30"/>
<circle x="-29" y="0" radius="3" width="0" layer="41"/>
<circle x="-29" y="0" radius="3" width="0" layer="42"/>
<hole x="-29" y="-49" drill="2.75"/>
<circle x="-29" y="-49" radius="3" width="0" layer="29"/>
<circle x="-29" y="-49" radius="3" width="0" layer="30"/>
<circle x="-29" y="-49" radius="3" width="0" layer="41"/>
<circle x="-29" y="-49" radius="3" width="0" layer="42"/>
<hole x="29" y="0" drill="2.75"/>
<circle x="29" y="0" radius="3" width="0" layer="29"/>
<circle x="29" y="0" radius="3" width="0" layer="30"/>
<circle x="29" y="0" radius="3" width="0" layer="41"/>
<circle x="29" y="0" radius="3" width="0" layer="42"/>
<hole x="29" y="-49" drill="2.75"/>
<circle x="29" y="-49" radius="3" width="0" layer="29"/>
<circle x="29" y="-49" radius="3" width="0" layer="30"/>
<circle x="29" y="-49" radius="3" width="0" layer="41"/>
<circle x="29" y="-49" radius="3" width="0" layer="42"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" shape="square"/>
<pad name="2" x="-24.13" y="1.27" drill="1"/>
<pad name="3" x="-21.59" y="-1.27" drill="1"/>
<pad name="4" x="-21.59" y="1.27" drill="1"/>
<pad name="5" x="-19.05" y="-1.27" drill="1"/>
<pad name="6" x="-19.05" y="1.27" drill="1"/>
<pad name="7" x="-16.51" y="-1.27" drill="1"/>
<pad name="8" x="-16.51" y="1.27" drill="1"/>
<pad name="9" x="-13.97" y="-1.27" drill="1"/>
<pad name="10" x="-13.97" y="1.27" drill="1"/>
<pad name="11" x="-11.43" y="-1.27" drill="1"/>
<pad name="12" x="-11.43" y="1.27" drill="1"/>
<pad name="13" x="-8.89" y="-1.27" drill="1"/>
<pad name="14" x="-8.89" y="1.27" drill="1"/>
<pad name="15" x="-6.35" y="-1.27" drill="1"/>
<pad name="16" x="-6.35" y="1.27" drill="1"/>
<pad name="17" x="-3.81" y="-1.27" drill="1"/>
<pad name="18" x="-3.81" y="1.27" drill="1"/>
<pad name="19" x="-1.27" y="-1.27" drill="1"/>
<pad name="20" x="-1.27" y="1.27" drill="1"/>
<pad name="21" x="1.27" y="-1.27" drill="1"/>
<pad name="22" x="1.27" y="1.27" drill="1"/>
<pad name="23" x="3.81" y="-1.27" drill="1"/>
<pad name="24" x="3.81" y="1.27" drill="1"/>
<pad name="25" x="6.35" y="-1.27" drill="1"/>
<pad name="26" x="6.35" y="1.27" drill="1"/>
<pad name="27" x="8.89" y="-1.27" drill="1"/>
<pad name="28" x="8.89" y="1.27" drill="1"/>
<pad name="29" x="11.43" y="-1.27" drill="1"/>
<pad name="30" x="11.43" y="1.27" drill="1"/>
<pad name="31" x="13.97" y="-1.27" drill="1"/>
<pad name="32" x="13.97" y="1.27" drill="1"/>
<pad name="33" x="16.51" y="-1.27" drill="1"/>
<pad name="34" x="16.51" y="1.27" drill="1"/>
<pad name="35" x="19.05" y="-1.27" drill="1"/>
<pad name="36" x="19.05" y="1.27" drill="1"/>
<pad name="37" x="21.59" y="-1.27" drill="1"/>
<pad name="38" x="21.59" y="1.27" drill="1"/>
<pad name="39" x="24.13" y="-1.27" drill="1"/>
<pad name="40" x="24.13" y="1.27" drill="1"/>
<wire x1="-25.4" y1="2.54" x2="-25.4" y2="0" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="-2.54" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-22.86" y1="-2.54" x2="25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="-2.54" x2="25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="2.54" x2="-25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-22.86" y2="0" width="0.127" layer="22"/>
<wire x1="-22.86" y1="0" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
</package>
<package name="RPI_3BP_THT_NFH_NODIM">
<wire x1="-32.5" y1="-49.5" x2="-29.5" y2="-52.5" width="0" layer="51" curve="90"/>
<wire x1="-29.5" y1="-52.5" x2="29.5" y2="-52.5" width="0" layer="51"/>
<wire x1="29.5" y1="-52.5" x2="32.5" y2="-49.5" width="0" layer="51" curve="90"/>
<wire x1="32.5" y1="-49.5" x2="32.5" y2="0.5" width="0" layer="51"/>
<wire x1="32.5" y1="0.5" x2="29.5" y2="3.5" width="0" layer="51" curve="90"/>
<wire x1="29.5" y1="3.5" x2="-29.5" y2="3.5" width="0" layer="51"/>
<wire x1="-29.5" y1="3.5" x2="-32.5" y2="0.5" width="0" layer="51" curve="90"/>
<wire x1="-32.5" y1="-49.5" x2="-32.5" y2="0.5" width="0" layer="51"/>
<hole x="-29" y="0" drill="2.75"/>
<circle x="-29" y="0" radius="3" width="0" layer="29"/>
<circle x="-29" y="0" radius="3" width="0" layer="30"/>
<circle x="-29" y="0" radius="3" width="0" layer="41"/>
<circle x="-29" y="0" radius="3" width="0" layer="42"/>
<hole x="-29" y="-49" drill="2.75"/>
<circle x="-29" y="-49" radius="3" width="0" layer="29"/>
<circle x="-29" y="-49" radius="3" width="0" layer="30"/>
<circle x="-29" y="-49" radius="3" width="0" layer="41"/>
<circle x="-29" y="-49" radius="3" width="0" layer="42"/>
<hole x="29" y="0" drill="2.75"/>
<circle x="29" y="0" radius="3" width="0" layer="29"/>
<circle x="29" y="0" radius="3" width="0" layer="30"/>
<circle x="29" y="0" radius="3" width="0" layer="41"/>
<circle x="29" y="0" radius="3" width="0" layer="42"/>
<hole x="29" y="-49" drill="2.75"/>
<circle x="29" y="-49" radius="3" width="0" layer="29"/>
<circle x="29" y="-49" radius="3" width="0" layer="30"/>
<circle x="29" y="-49" radius="3" width="0" layer="41"/>
<circle x="29" y="-49" radius="3" width="0" layer="42"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" shape="square"/>
<pad name="2" x="-24.13" y="1.27" drill="1"/>
<pad name="3" x="-21.59" y="-1.27" drill="1"/>
<pad name="4" x="-21.59" y="1.27" drill="1"/>
<pad name="5" x="-19.05" y="-1.27" drill="1"/>
<pad name="6" x="-19.05" y="1.27" drill="1"/>
<pad name="7" x="-16.51" y="-1.27" drill="1"/>
<pad name="8" x="-16.51" y="1.27" drill="1"/>
<pad name="9" x="-13.97" y="-1.27" drill="1"/>
<pad name="10" x="-13.97" y="1.27" drill="1"/>
<pad name="11" x="-11.43" y="-1.27" drill="1"/>
<pad name="12" x="-11.43" y="1.27" drill="1"/>
<pad name="13" x="-8.89" y="-1.27" drill="1"/>
<pad name="14" x="-8.89" y="1.27" drill="1"/>
<pad name="15" x="-6.35" y="-1.27" drill="1"/>
<pad name="16" x="-6.35" y="1.27" drill="1"/>
<pad name="17" x="-3.81" y="-1.27" drill="1"/>
<pad name="18" x="-3.81" y="1.27" drill="1"/>
<pad name="19" x="-1.27" y="-1.27" drill="1"/>
<pad name="20" x="-1.27" y="1.27" drill="1"/>
<pad name="21" x="1.27" y="-1.27" drill="1"/>
<pad name="22" x="1.27" y="1.27" drill="1"/>
<pad name="23" x="3.81" y="-1.27" drill="1"/>
<pad name="24" x="3.81" y="1.27" drill="1"/>
<pad name="25" x="6.35" y="-1.27" drill="1"/>
<pad name="26" x="6.35" y="1.27" drill="1"/>
<pad name="27" x="8.89" y="-1.27" drill="1"/>
<pad name="28" x="8.89" y="1.27" drill="1"/>
<pad name="29" x="11.43" y="-1.27" drill="1"/>
<pad name="30" x="11.43" y="1.27" drill="1"/>
<pad name="31" x="13.97" y="-1.27" drill="1"/>
<pad name="32" x="13.97" y="1.27" drill="1"/>
<pad name="33" x="16.51" y="-1.27" drill="1"/>
<pad name="34" x="16.51" y="1.27" drill="1"/>
<pad name="35" x="19.05" y="-1.27" drill="1"/>
<pad name="36" x="19.05" y="1.27" drill="1"/>
<pad name="37" x="21.59" y="-1.27" drill="1"/>
<pad name="38" x="21.59" y="1.27" drill="1"/>
<pad name="39" x="24.13" y="-1.27" drill="1"/>
<pad name="40" x="24.13" y="1.27" drill="1"/>
<wire x1="-25.4" y1="2.54" x2="-25.4" y2="0" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="-2.54" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-22.86" y1="-2.54" x2="25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="-2.54" x2="25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="2.54" x2="-25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-22.86" y2="0" width="0.127" layer="22"/>
<wire x1="-22.86" y1="0" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
</package>
<package name="RPI_ZERO_THT_NODIM">
<wire x1="-32.5" y1="-24" x2="-29.5" y2="-27" width="0" layer="51" curve="90"/>
<wire x1="-29.5" y1="-27" x2="29.5" y2="-27" width="0" layer="51"/>
<wire x1="29.5" y1="-27" x2="32.5" y2="-24" width="0" layer="51" curve="90"/>
<wire x1="32.5" y1="-24" x2="32.5" y2="0.5" width="0" layer="51"/>
<wire x1="32.5" y1="0.5" x2="29.5" y2="3.5" width="0" layer="51" curve="90"/>
<wire x1="29.5" y1="3.5" x2="-29.5" y2="3.5" width="0" layer="51"/>
<wire x1="-29.5" y1="3.5" x2="-32.5" y2="0.5" width="0" layer="51" curve="90"/>
<wire x1="-32.5" y1="-24" x2="-32.5" y2="0.5" width="0" layer="51"/>
<hole x="-29" y="0" drill="2.75"/>
<circle x="-29" y="0" radius="3" width="0" layer="29"/>
<circle x="-29" y="0" radius="3" width="0" layer="30"/>
<circle x="-29" y="0" radius="3" width="0" layer="41"/>
<circle x="-29" y="0" radius="3" width="0" layer="42"/>
<hole x="-29" y="-23.5" drill="2.75"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="29"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="30"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="41"/>
<circle x="-29" y="-23.5" radius="3" width="0" layer="42"/>
<hole x="29" y="0" drill="2.75"/>
<circle x="29" y="0" radius="3" width="0" layer="29"/>
<circle x="29" y="0" radius="3" width="0" layer="30"/>
<circle x="29" y="0" radius="3" width="0" layer="41"/>
<circle x="29" y="0" radius="3" width="0" layer="42"/>
<hole x="29" y="-23.5" drill="2.75"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="29"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="30"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="41"/>
<circle x="29" y="-23.5" radius="3" width="0" layer="42"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" shape="square"/>
<pad name="2" x="-24.13" y="1.27" drill="1"/>
<pad name="3" x="-21.59" y="-1.27" drill="1"/>
<pad name="4" x="-21.59" y="1.27" drill="1"/>
<pad name="5" x="-19.05" y="-1.27" drill="1"/>
<pad name="6" x="-19.05" y="1.27" drill="1"/>
<pad name="7" x="-16.51" y="-1.27" drill="1"/>
<pad name="8" x="-16.51" y="1.27" drill="1"/>
<pad name="9" x="-13.97" y="-1.27" drill="1"/>
<pad name="10" x="-13.97" y="1.27" drill="1"/>
<pad name="11" x="-11.43" y="-1.27" drill="1"/>
<pad name="12" x="-11.43" y="1.27" drill="1"/>
<pad name="13" x="-8.89" y="-1.27" drill="1"/>
<pad name="14" x="-8.89" y="1.27" drill="1"/>
<pad name="15" x="-6.35" y="-1.27" drill="1"/>
<pad name="16" x="-6.35" y="1.27" drill="1"/>
<pad name="17" x="-3.81" y="-1.27" drill="1"/>
<pad name="18" x="-3.81" y="1.27" drill="1"/>
<pad name="19" x="-1.27" y="-1.27" drill="1"/>
<pad name="20" x="-1.27" y="1.27" drill="1"/>
<pad name="21" x="1.27" y="-1.27" drill="1"/>
<pad name="22" x="1.27" y="1.27" drill="1"/>
<pad name="23" x="3.81" y="-1.27" drill="1"/>
<pad name="24" x="3.81" y="1.27" drill="1"/>
<pad name="25" x="6.35" y="-1.27" drill="1"/>
<pad name="26" x="6.35" y="1.27" drill="1"/>
<pad name="27" x="8.89" y="-1.27" drill="1"/>
<pad name="28" x="8.89" y="1.27" drill="1"/>
<pad name="29" x="11.43" y="-1.27" drill="1"/>
<pad name="30" x="11.43" y="1.27" drill="1"/>
<pad name="31" x="13.97" y="-1.27" drill="1"/>
<pad name="32" x="13.97" y="1.27" drill="1"/>
<pad name="33" x="16.51" y="-1.27" drill="1"/>
<pad name="34" x="16.51" y="1.27" drill="1"/>
<pad name="35" x="19.05" y="-1.27" drill="1"/>
<pad name="36" x="19.05" y="1.27" drill="1"/>
<pad name="37" x="21.59" y="-1.27" drill="1"/>
<pad name="38" x="21.59" y="1.27" drill="1"/>
<pad name="39" x="24.13" y="-1.27" drill="1"/>
<pad name="40" x="24.13" y="1.27" drill="1"/>
<wire x1="-25.4" y1="2.54" x2="-25.4" y2="0" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="-2.54" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
<wire x1="-22.86" y1="-2.54" x2="25.4" y2="-2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="-2.54" x2="25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="25.4" y1="2.54" x2="-25.4" y2="2.54" width="0.127" layer="22"/>
<wire x1="-25.4" y1="0" x2="-22.86" y2="0" width="0.127" layer="22"/>
<wire x1="-22.86" y1="0" x2="-22.86" y2="-2.54" width="0.127" layer="22"/>
</package>
</packages>
<symbols>
<symbol name="RPI_40_CONDENSED">
<pin name="3V3" x="-25.4" y="17.78" length="short" direction="pwr"/>
<pin name="GPIO2@3" x="22.86" y="20.32" length="short" rot="R180"/>
<pin name="GPIO3@5" x="22.86" y="17.78" length="short" rot="R180"/>
<pin name="GPIO4@7" x="22.86" y="15.24" length="short" rot="R180"/>
<pin name="GND" x="-25.4" y="15.24" length="short" direction="pwr"/>
<pin name="GPIO17@11" x="22.86" y="-17.78" length="short" rot="R180"/>
<pin name="GPIO27@13" x="-25.4" y="-20.32" length="short"/>
<pin name="GPIO22@15" x="-25.4" y="-7.62" length="short"/>
<pin name="GPIO10@19" x="22.86" y="0" length="short" rot="R180"/>
<pin name="GPIO9@21" x="22.86" y="2.54" length="short" rot="R180"/>
<pin name="GPIO11@23" x="22.86" y="-2.54" length="short" rot="R180"/>
<pin name="ID_SD@27" x="-25.4" y="5.08" length="short"/>
<pin name="GPIO5@29" x="22.86" y="12.7" length="short" rot="R180"/>
<pin name="GPIO6@31" x="22.86" y="10.16" length="short" rot="R180"/>
<pin name="GPIO13@33" x="22.86" y="-7.62" length="short" rot="R180"/>
<pin name="GPIO19@35" x="-25.4" y="0" length="short"/>
<pin name="GPIO26@37" x="-25.4" y="-17.78" length="short"/>
<pin name="5V0" x="-25.4" y="20.32" length="short" direction="pwr"/>
<pin name="GPIO14@8" x="22.86" y="-10.16" length="short" rot="R180"/>
<pin name="GPIO15@10" x="22.86" y="-12.7" length="short" rot="R180"/>
<pin name="GPIO18@12" x="22.86" y="-20.32" length="short" rot="R180"/>
<pin name="GPIO23@16" x="-25.4" y="-10.16" length="short"/>
<pin name="GPIO24@18" x="-25.4" y="-12.7" length="short"/>
<pin name="GPIO25@22" x="-25.4" y="-15.24" length="short"/>
<pin name="GPIO8@24" x="22.86" y="5.08" length="short" rot="R180"/>
<pin name="GPIO7@26" x="22.86" y="7.62" length="short" rot="R180"/>
<pin name="ID_SC@28" x="-25.4" y="7.62" length="short"/>
<pin name="GPIO12@32" x="22.86" y="-5.08" length="short" rot="R180"/>
<pin name="GPIO16@36" x="22.86" y="-15.24" length="short" rot="R180"/>
<pin name="GPIO20@38" x="-25.4" y="-2.54" length="short"/>
<pin name="GPIO21@40" x="-25.4" y="-5.08" length="short"/>
<wire x1="-22.86" y1="22.86" x2="-22.86" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-22.86" y1="-22.86" x2="20.32" y2="-22.86" width="0.254" layer="94"/>
<wire x1="20.32" y1="-22.86" x2="20.32" y2="22.86" width="0.254" layer="94"/>
<wire x1="20.32" y1="22.86" x2="-22.86" y2="22.86" width="0.254" layer="94"/>
<text x="-22.86" y="23.368" size="1.27" layer="95">&gt;NAME</text>
<text x="-22.86" y="-24.638" size="1.27" layer="96">&gt;VALUE</text>
<text x="5.08" y="-12.446" size="1.778" layer="97" rot="MR0">UART0</text>
<text x="-6.858" y="-6.096" size="1.778" layer="97">SPI1</text>
<text x="8.89" y="-10.668" size="1.016" layer="97" rot="MR0">TXD</text>
<text x="8.89" y="-13.208" size="1.016" layer="97" rot="MR0">RXD</text>
<text x="8.89" y="-20.828" size="1.016" layer="97" rot="MR0">PWM0</text>
<text x="8.89" y="7.112" size="1.016" layer="97" rot="MR0">CE0</text>
<text x="8.89" y="4.572" size="1.016" layer="97" rot="MR0">CE1</text>
<text x="8.89" y="-0.508" size="1.016" layer="97" rot="MR0">MOSI</text>
<text x="8.89" y="2.032" size="1.016" layer="97" rot="MR0">MISO</text>
<text x="8.89" y="-3.048" size="1.016" layer="97" rot="MR0">SCLK</text>
<text x="-11.684" y="-5.588" size="1.016" layer="97">SCLK</text>
<text x="-11.684" y="-3.048" size="1.016" layer="97">MOSI</text>
<text x="-11.684" y="-0.508" size="1.016" layer="97">MISO</text>
<text x="8.89" y="19.812" size="1.016" layer="97" rot="MR0">SDA</text>
<text x="8.89" y="17.272" size="1.016" layer="97" rot="MR0">SCL</text>
<text x="8.89" y="14.732" size="1.016" layer="97" rot="MR0">GPCLK0</text>
<text x="8.89" y="-8.128" size="1.016" layer="97" rot="MR0">PWM1</text>
<text x="8.89" y="-5.588" size="1.016" layer="97" rot="MR0">PWM0</text>
<wire x1="-8.128" y1="0.762" x2="-7.62" y2="0.762" width="0.127" layer="97"/>
<wire x1="-7.62" y1="0.762" x2="-7.62" y2="-5.842" width="0.127" layer="97"/>
<wire x1="-7.62" y1="-5.842" x2="-8.128" y2="-5.842" width="0.127" layer="97"/>
<wire x1="5.842" y1="-13.462" x2="5.334" y2="-13.462" width="0.127" layer="97"/>
<wire x1="5.334" y1="-13.462" x2="5.334" y2="-9.398" width="0.127" layer="97"/>
<wire x1="5.334" y1="-9.398" x2="5.842" y2="-9.398" width="0.127" layer="97"/>
<text x="5.08" y="18.034" size="1.778" layer="97" rot="MR0">I2C1</text>
<wire x1="5.842" y1="17.018" x2="5.334" y2="17.018" width="0.127" layer="97"/>
<wire x1="5.334" y1="17.018" x2="5.334" y2="21.082" width="0.127" layer="97"/>
<wire x1="5.334" y1="21.082" x2="5.842" y2="21.082" width="0.127" layer="97"/>
<text x="4.318" y="1.778" size="1.778" layer="97" rot="MR0">SPI0</text>
<wire x1="5.08" y1="-3.302" x2="4.572" y2="-3.302" width="0.127" layer="97"/>
<wire x1="4.572" y1="-3.302" x2="4.572" y2="8.382" width="0.127" layer="97"/>
<wire x1="4.572" y1="8.382" x2="5.08" y2="8.382" width="0.127" layer="97"/>
<text x="8.89" y="-18.288" size="1.016" layer="97" rot="MR0">CE1</text>
<text x="5.588" y="-18.796" size="1.778" layer="97" rot="MR0">SPI1</text>
<text x="-11.684" y="-10.668" size="1.016" layer="97">CE2</text>
<wire x1="-7.62" y1="-5.842" x2="-7.62" y2="-10.16" width="0.127" layer="97"/>
<wire x1="-7.62" y1="-10.16" x2="-8.128" y2="-10.16" width="0.127" layer="97"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RPI_CONDENSED" prefix="X">
<gates>
<gate name="G$1" symbol="RPI_40_CONDENSED" x="0" y="0"/>
</gates>
<devices>
<device name="3" package="RPI_3BP_THT">
<connects>
<connect gate="G$1" pin="3V3" pad="1 17"/>
<connect gate="G$1" pin="5V0" pad="2 4"/>
<connect gate="G$1" pin="GND" pad="6 9 14 20 25 30 34 39"/>
<connect gate="G$1" pin="GPIO10@19" pad="19"/>
<connect gate="G$1" pin="GPIO11@23" pad="23"/>
<connect gate="G$1" pin="GPIO12@32" pad="32"/>
<connect gate="G$1" pin="GPIO13@33" pad="33"/>
<connect gate="G$1" pin="GPIO14@8" pad="8"/>
<connect gate="G$1" pin="GPIO15@10" pad="10"/>
<connect gate="G$1" pin="GPIO16@36" pad="36"/>
<connect gate="G$1" pin="GPIO17@11" pad="11"/>
<connect gate="G$1" pin="GPIO18@12" pad="12"/>
<connect gate="G$1" pin="GPIO19@35" pad="35"/>
<connect gate="G$1" pin="GPIO20@38" pad="38"/>
<connect gate="G$1" pin="GPIO21@40" pad="40"/>
<connect gate="G$1" pin="GPIO22@15" pad="15"/>
<connect gate="G$1" pin="GPIO23@16" pad="16"/>
<connect gate="G$1" pin="GPIO24@18" pad="18"/>
<connect gate="G$1" pin="GPIO25@22" pad="22"/>
<connect gate="G$1" pin="GPIO26@37" pad="37"/>
<connect gate="G$1" pin="GPIO27@13" pad="13"/>
<connect gate="G$1" pin="GPIO2@3" pad="3"/>
<connect gate="G$1" pin="GPIO3@5" pad="5"/>
<connect gate="G$1" pin="GPIO4@7" pad="7"/>
<connect gate="G$1" pin="GPIO5@29" pad="29"/>
<connect gate="G$1" pin="GPIO6@31" pad="31"/>
<connect gate="G$1" pin="GPIO7@26" pad="26"/>
<connect gate="G$1" pin="GPIO8@24" pad="24"/>
<connect gate="G$1" pin="GPIO9@21" pad="21"/>
<connect gate="G$1" pin="ID_SC@28" pad="28"/>
<connect gate="G$1" pin="ID_SD@27" pad="27"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ZERO" package="RPI_ZERO_THT">
<connects>
<connect gate="G$1" pin="3V3" pad="1 17"/>
<connect gate="G$1" pin="5V0" pad="2 4"/>
<connect gate="G$1" pin="GND" pad="6 9 14 20 25 30 34 39"/>
<connect gate="G$1" pin="GPIO10@19" pad="19"/>
<connect gate="G$1" pin="GPIO11@23" pad="23"/>
<connect gate="G$1" pin="GPIO12@32" pad="32"/>
<connect gate="G$1" pin="GPIO13@33" pad="33"/>
<connect gate="G$1" pin="GPIO14@8" pad="8"/>
<connect gate="G$1" pin="GPIO15@10" pad="10"/>
<connect gate="G$1" pin="GPIO16@36" pad="36"/>
<connect gate="G$1" pin="GPIO17@11" pad="11"/>
<connect gate="G$1" pin="GPIO18@12" pad="12"/>
<connect gate="G$1" pin="GPIO19@35" pad="35"/>
<connect gate="G$1" pin="GPIO20@38" pad="38"/>
<connect gate="G$1" pin="GPIO21@40" pad="40"/>
<connect gate="G$1" pin="GPIO22@15" pad="15"/>
<connect gate="G$1" pin="GPIO23@16" pad="16"/>
<connect gate="G$1" pin="GPIO24@18" pad="18"/>
<connect gate="G$1" pin="GPIO25@22" pad="22"/>
<connect gate="G$1" pin="GPIO26@37" pad="37"/>
<connect gate="G$1" pin="GPIO27@13" pad="13"/>
<connect gate="G$1" pin="GPIO2@3" pad="3"/>
<connect gate="G$1" pin="GPIO3@5" pad="5"/>
<connect gate="G$1" pin="GPIO4@7" pad="7"/>
<connect gate="G$1" pin="GPIO5@29" pad="29"/>
<connect gate="G$1" pin="GPIO6@31" pad="31"/>
<connect gate="G$1" pin="GPIO7@26" pad="26"/>
<connect gate="G$1" pin="GPIO8@24" pad="24"/>
<connect gate="G$1" pin="GPIO9@21" pad="21"/>
<connect gate="G$1" pin="ID_SC@28" pad="28"/>
<connect gate="G$1" pin="ID_SD@27" pad="27"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3NFH" package="RPI_3BP_THT_NFH">
<connects>
<connect gate="G$1" pin="3V3" pad="1 17"/>
<connect gate="G$1" pin="5V0" pad="2 4"/>
<connect gate="G$1" pin="GND" pad="6 9 14 20 25 30 34 39"/>
<connect gate="G$1" pin="GPIO10@19" pad="19"/>
<connect gate="G$1" pin="GPIO11@23" pad="23"/>
<connect gate="G$1" pin="GPIO12@32" pad="32"/>
<connect gate="G$1" pin="GPIO13@33" pad="33"/>
<connect gate="G$1" pin="GPIO14@8" pad="8"/>
<connect gate="G$1" pin="GPIO15@10" pad="10"/>
<connect gate="G$1" pin="GPIO16@36" pad="36"/>
<connect gate="G$1" pin="GPIO17@11" pad="11"/>
<connect gate="G$1" pin="GPIO18@12" pad="12"/>
<connect gate="G$1" pin="GPIO19@35" pad="35"/>
<connect gate="G$1" pin="GPIO20@38" pad="38"/>
<connect gate="G$1" pin="GPIO21@40" pad="40"/>
<connect gate="G$1" pin="GPIO22@15" pad="15"/>
<connect gate="G$1" pin="GPIO23@16" pad="16"/>
<connect gate="G$1" pin="GPIO24@18" pad="18"/>
<connect gate="G$1" pin="GPIO25@22" pad="22"/>
<connect gate="G$1" pin="GPIO26@37" pad="37"/>
<connect gate="G$1" pin="GPIO27@13" pad="13"/>
<connect gate="G$1" pin="GPIO2@3" pad="3"/>
<connect gate="G$1" pin="GPIO3@5" pad="5"/>
<connect gate="G$1" pin="GPIO4@7" pad="7"/>
<connect gate="G$1" pin="GPIO5@29" pad="29"/>
<connect gate="G$1" pin="GPIO6@31" pad="31"/>
<connect gate="G$1" pin="GPIO7@26" pad="26"/>
<connect gate="G$1" pin="GPIO8@24" pad="24"/>
<connect gate="G$1" pin="GPIO9@21" pad="21"/>
<connect gate="G$1" pin="ID_SC@28" pad="28"/>
<connect gate="G$1" pin="ID_SD@27" pad="27"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3NFH_NODIM" package="RPI_3BP_THT_NFH_NODIM">
<connects>
<connect gate="G$1" pin="3V3" pad="1 17"/>
<connect gate="G$1" pin="5V0" pad="2 4"/>
<connect gate="G$1" pin="GND" pad="6 9 14 20 25 30 34 39"/>
<connect gate="G$1" pin="GPIO10@19" pad="19"/>
<connect gate="G$1" pin="GPIO11@23" pad="23"/>
<connect gate="G$1" pin="GPIO12@32" pad="32"/>
<connect gate="G$1" pin="GPIO13@33" pad="33"/>
<connect gate="G$1" pin="GPIO14@8" pad="8"/>
<connect gate="G$1" pin="GPIO15@10" pad="10"/>
<connect gate="G$1" pin="GPIO16@36" pad="36"/>
<connect gate="G$1" pin="GPIO17@11" pad="11"/>
<connect gate="G$1" pin="GPIO18@12" pad="12"/>
<connect gate="G$1" pin="GPIO19@35" pad="35"/>
<connect gate="G$1" pin="GPIO20@38" pad="38"/>
<connect gate="G$1" pin="GPIO21@40" pad="40"/>
<connect gate="G$1" pin="GPIO22@15" pad="15"/>
<connect gate="G$1" pin="GPIO23@16" pad="16"/>
<connect gate="G$1" pin="GPIO24@18" pad="18"/>
<connect gate="G$1" pin="GPIO25@22" pad="22"/>
<connect gate="G$1" pin="GPIO26@37" pad="37"/>
<connect gate="G$1" pin="GPIO27@13" pad="13"/>
<connect gate="G$1" pin="GPIO2@3" pad="3"/>
<connect gate="G$1" pin="GPIO3@5" pad="5"/>
<connect gate="G$1" pin="GPIO4@7" pad="7"/>
<connect gate="G$1" pin="GPIO5@29" pad="29"/>
<connect gate="G$1" pin="GPIO6@31" pad="31"/>
<connect gate="G$1" pin="GPIO7@26" pad="26"/>
<connect gate="G$1" pin="GPIO8@24" pad="24"/>
<connect gate="G$1" pin="GPIO9@21" pad="21"/>
<connect gate="G$1" pin="ID_SC@28" pad="28"/>
<connect gate="G$1" pin="ID_SD@27" pad="27"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ZERO_NODIM" package="RPI_ZERO_THT_NODIM">
<connects>
<connect gate="G$1" pin="3V3" pad="1 17"/>
<connect gate="G$1" pin="5V0" pad="2 4"/>
<connect gate="G$1" pin="GND" pad="6 9 14 20 25 30 34 39"/>
<connect gate="G$1" pin="GPIO10@19" pad="19"/>
<connect gate="G$1" pin="GPIO11@23" pad="23"/>
<connect gate="G$1" pin="GPIO12@32" pad="32"/>
<connect gate="G$1" pin="GPIO13@33" pad="33"/>
<connect gate="G$1" pin="GPIO14@8" pad="8"/>
<connect gate="G$1" pin="GPIO15@10" pad="10"/>
<connect gate="G$1" pin="GPIO16@36" pad="36"/>
<connect gate="G$1" pin="GPIO17@11" pad="11"/>
<connect gate="G$1" pin="GPIO18@12" pad="12"/>
<connect gate="G$1" pin="GPIO19@35" pad="35"/>
<connect gate="G$1" pin="GPIO20@38" pad="38"/>
<connect gate="G$1" pin="GPIO21@40" pad="40"/>
<connect gate="G$1" pin="GPIO22@15" pad="15"/>
<connect gate="G$1" pin="GPIO23@16" pad="16"/>
<connect gate="G$1" pin="GPIO24@18" pad="18"/>
<connect gate="G$1" pin="GPIO25@22" pad="22"/>
<connect gate="G$1" pin="GPIO26@37" pad="37"/>
<connect gate="G$1" pin="GPIO27@13" pad="13"/>
<connect gate="G$1" pin="GPIO2@3" pad="3"/>
<connect gate="G$1" pin="GPIO3@5" pad="5"/>
<connect gate="G$1" pin="GPIO4@7" pad="7"/>
<connect gate="G$1" pin="GPIO5@29" pad="29"/>
<connect gate="G$1" pin="GPIO6@31" pad="31"/>
<connect gate="G$1" pin="GPIO7@26" pad="26"/>
<connect gate="G$1" pin="GPIO8@24" pad="24"/>
<connect gate="G$1" pin="GPIO9@21" pad="21"/>
<connect gate="G$1" pin="ID_SC@28" pad="28"/>
<connect gate="G$1" pin="ID_SD@27" pad="27"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2X08" urn="urn:adsk.eagle:footprint:22373/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-1.905" x2="-9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-2.54" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.905" x2="-9.525" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.54" x2="-8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="2.54" x2="-7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-5.08" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.08" y2="1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.54" x2="7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-2.54" x2="-8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="8.255" y1="2.54" x2="9.525" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.525" y1="2.54" x2="10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.16" y1="1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.54" x2="9.525" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-8.89" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-6.35" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-6.35" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="-3.81" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="-3.81" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="-1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="-1.27" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="1.27" y="1.27" drill="1.016" shape="octagon"/>
<pad name="11" x="3.81" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="12" x="3.81" y="1.27" drill="1.016" shape="octagon"/>
<pad name="13" x="6.35" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="14" x="6.35" y="1.27" drill="1.016" shape="octagon"/>
<pad name="15" x="8.89" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="16" x="8.89" y="1.27" drill="1.016" shape="octagon"/>
<text x="-10.16" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.16" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-9.144" y1="-1.524" x2="-8.636" y2="-1.016" layer="51"/>
<rectangle x1="-9.144" y1="1.016" x2="-8.636" y2="1.524" layer="51"/>
<rectangle x1="-6.604" y1="1.016" x2="-6.096" y2="1.524" layer="51"/>
<rectangle x1="-6.604" y1="-1.524" x2="-6.096" y2="-1.016" layer="51"/>
<rectangle x1="-4.064" y1="1.016" x2="-3.556" y2="1.524" layer="51"/>
<rectangle x1="-4.064" y1="-1.524" x2="-3.556" y2="-1.016" layer="51"/>
<rectangle x1="-1.524" y1="1.016" x2="-1.016" y2="1.524" layer="51"/>
<rectangle x1="1.016" y1="1.016" x2="1.524" y2="1.524" layer="51"/>
<rectangle x1="3.556" y1="1.016" x2="4.064" y2="1.524" layer="51"/>
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.016" layer="51"/>
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-1.016" layer="51"/>
<rectangle x1="3.556" y1="-1.524" x2="4.064" y2="-1.016" layer="51"/>
<rectangle x1="6.096" y1="1.016" x2="6.604" y2="1.524" layer="51"/>
<rectangle x1="6.096" y1="-1.524" x2="6.604" y2="-1.016" layer="51"/>
<rectangle x1="8.636" y1="1.016" x2="9.144" y2="1.524" layer="51"/>
<rectangle x1="8.636" y1="-1.524" x2="9.144" y2="-1.016" layer="51"/>
</package>
<package name="2X08/90" urn="urn:adsk.eagle:footprint:22374/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="6.985" x2="8.89" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-8.89" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-6.35" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="-3.81" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="-1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="12" x="3.81" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="14" x="6.35" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="16" x="8.89" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-8.89" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-6.35" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="-3.81" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="-1.27" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="1.27" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="11" x="3.81" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="13" x="6.35" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="15" x="8.89" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-10.795" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="12.065" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-9.271" y1="-5.461" x2="-8.509" y2="-4.699" layer="21"/>
<rectangle x1="-9.271" y1="-4.699" x2="-8.509" y2="-2.921" layer="51"/>
<rectangle x1="-6.731" y1="-4.699" x2="-5.969" y2="-2.921" layer="51"/>
<rectangle x1="-6.731" y1="-5.461" x2="-5.969" y2="-4.699" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-5.461" x2="-3.429" y2="-4.699" layer="21"/>
<rectangle x1="-4.191" y1="-4.699" x2="-3.429" y2="-2.921" layer="51"/>
<rectangle x1="-1.651" y1="-4.699" x2="-0.889" y2="-2.921" layer="51"/>
<rectangle x1="-1.651" y1="-5.461" x2="-0.889" y2="-4.699" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-5.461" x2="1.651" y2="-4.699" layer="21"/>
<rectangle x1="0.889" y1="-4.699" x2="1.651" y2="-2.921" layer="51"/>
<rectangle x1="3.429" y1="-4.699" x2="4.191" y2="-2.921" layer="51"/>
<rectangle x1="3.429" y1="-5.461" x2="4.191" y2="-4.699" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-5.461" x2="6.731" y2="-4.699" layer="21"/>
<rectangle x1="5.969" y1="-4.699" x2="6.731" y2="-2.921" layer="51"/>
<rectangle x1="8.509" y1="-4.699" x2="9.271" y2="-2.921" layer="51"/>
<rectangle x1="8.509" y1="-5.461" x2="9.271" y2="-4.699" layer="21"/>
</package>
<package name="1X03" urn="urn:adsk.eagle:footprint:22340/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.8862" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="1X03/90" urn="urn:adsk.eagle:footprint:22341/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-4.445" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="5.715" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
</package>
<package name="1X02" urn="urn:adsk.eagle:footprint:22309/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90" urn="urn:adsk.eagle:footprint:22310/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="2X08" urn="urn:adsk.eagle:package:22481/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X08"/>
</packageinstances>
</package3d>
<package3d name="2X08/90" urn="urn:adsk.eagle:package:22488/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X08/90"/>
</packageinstances>
</package3d>
<package3d name="1X03" urn="urn:adsk.eagle:package:22458/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03"/>
</packageinstances>
</package3d>
<package3d name="1X03/90" urn="urn:adsk.eagle:package:22459/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03/90"/>
</packageinstances>
</package3d>
<package3d name="1X02" urn="urn:adsk.eagle:package:22435/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X02"/>
</packageinstances>
</package3d>
<package3d name="1X02/90" urn="urn:adsk.eagle:package:22437/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X02/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINH2X8" urn="urn:adsk.eagle:symbol:22372/1" library_version="3">
<wire x1="-6.35" y1="-12.7" x2="8.89" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-12.7" x2="8.89" y2="10.16" width="0.4064" layer="94"/>
<wire x1="8.89" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-12.7" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="11" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="12" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="13" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="14" x="5.08" y="-7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="15" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="16" x="5.08" y="-10.16" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
<symbol name="PINHD3" urn="urn:adsk.eagle:symbol:22339/1" library_version="3">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD2" urn="urn:adsk.eagle:symbol:22308/1" library_version="3">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X8" urn="urn:adsk.eagle:component:22549/3" prefix="JP" uservalue="yes" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X08">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22481/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="2X08/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22488/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X3" urn="urn:adsk.eagle:component:22524/3" prefix="JP" uservalue="yes" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X03">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22458/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X03/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22459/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X2" urn="urn:adsk.eagle:component:22516/3" prefix="JP" uservalue="yes" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22435/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22437/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Texas Instruments - SN74HCT541N">
<description>Upverter Parts Library

Created by Upverter.com</description>
<packages>
<package name="TEXAS_INSTRUMENTS_SN74HCT541N_0">
<description>Buffer, Non-Inverting 1 Element 8 Bit per Element 3-State Output 20-PDIP</description>
<wire x1="-3.3" y1="-13.46" x2="-3.3" y2="13.46" width="0.15" layer="51"/>
<wire x1="-3.3" y1="13.46" x2="3.3" y2="13.46" width="0.15" layer="51"/>
<wire x1="3.3" y1="13.46" x2="3.3" y2="-13.46" width="0.15" layer="51"/>
<wire x1="3.3" y1="-13.46" x2="-3.3" y2="-13.46" width="0.15" layer="51"/>
<wire x1="-2.175" y1="12.7" x2="-2.175" y2="-12.7" width="0.15" layer="21"/>
<wire x1="-2.175" y1="-12.7" x2="2.175" y2="-12.7" width="0.15" layer="21"/>
<wire x1="2.175" y1="-12.7" x2="2.175" y2="12.7" width="0.15" layer="21"/>
<wire x1="2.175" y1="12.7" x2="0.621" y2="12.7" width="0.15" layer="21"/>
<wire x1="0.621" y1="12.7" x2="0.621" y2="12.2" width="0.15" layer="21"/>
<wire x1="0.621" y1="12.2" x2="-0.621" y2="12.2" width="0.15" layer="21"/>
<wire x1="-0.621" y1="12.2" x2="-0.621" y2="12.7" width="0.15" layer="21"/>
<wire x1="-0.621" y1="12.7" x2="-2.175" y2="12.7" width="0.15" layer="21"/>
<wire x1="-4.695" y1="-13.56" x2="-4.695" y2="13.56" width="0.1" layer="41"/>
<wire x1="-4.695" y1="13.56" x2="4.695" y2="13.56" width="0.1" layer="41"/>
<wire x1="4.695" y1="13.56" x2="4.695" y2="-13.56" width="0.1" layer="41"/>
<wire x1="4.695" y1="-13.56" x2="-4.695" y2="-13.56" width="0.1" layer="41"/>
<text x="-3.22" y="13.85" size="1" layer="25">&gt;NAME</text>
<circle x="-5.245" y="11.43" radius="0.25" width="0" layer="21"/>
<pad name="1" x="-3.97" y="11.43" drill="0.75" diameter="1.25" shape="square"/>
<pad name="2" x="-3.97" y="8.89" drill="0.75" diameter="1.25"/>
<pad name="3" x="-3.97" y="6.35" drill="0.75" diameter="1.25"/>
<pad name="4" x="-3.97" y="3.81" drill="0.75" diameter="1.25"/>
<pad name="5" x="-3.97" y="1.27" drill="0.75" diameter="1.25"/>
<pad name="6" x="-3.97" y="-1.27" drill="0.75" diameter="1.25"/>
<pad name="7" x="-3.97" y="-3.81" drill="0.75" diameter="1.25"/>
<pad name="8" x="-3.97" y="-6.35" drill="0.75" diameter="1.25"/>
<pad name="9" x="-3.97" y="-8.89" drill="0.75" diameter="1.25"/>
<pad name="10" x="-3.97" y="-11.43" drill="0.75" diameter="1.25"/>
<pad name="11" x="3.97" y="-11.43" drill="0.75" diameter="1.25"/>
<pad name="12" x="3.97" y="-8.89" drill="0.75" diameter="1.25"/>
<pad name="13" x="3.97" y="-6.35" drill="0.75" diameter="1.25"/>
<pad name="14" x="3.97" y="-3.81" drill="0.75" diameter="1.25"/>
<pad name="15" x="3.97" y="-1.27" drill="0.75" diameter="1.25"/>
<pad name="16" x="3.97" y="1.27" drill="0.75" diameter="1.25"/>
<pad name="17" x="3.97" y="3.81" drill="0.75" diameter="1.25"/>
<pad name="18" x="3.97" y="6.35" drill="0.75" diameter="1.25"/>
<pad name="19" x="3.97" y="8.89" drill="0.75" diameter="1.25"/>
<pad name="20" x="3.97" y="11.43" drill="0.75" diameter="1.25"/>
</package>
</packages>
<symbols>
<symbol name="TEXAS_INSTRUMENTS_SN74HCT541N_0_0">
<description>Buffer, Non-Inverting 1 Element 8 Bit per Element 3-State Output 20-PDIP</description>
<wire x1="2.54" y1="-43.18" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="25.4" y2="-5.08" width="0.254" layer="94"/>
<wire x1="25.4" y1="-5.08" x2="25.4" y2="-43.18" width="0.254" layer="94"/>
<wire x1="25.4" y1="-43.18" x2="2.54" y2="-43.18" width="0.254" layer="94"/>
<wire x1="2.54" y1="-38.1" x2="2.54" y2="-38.1" width="0.15" layer="94"/>
<wire x1="2.54" y1="-40.64" x2="2.54" y2="-40.64" width="0.15" layer="94"/>
<wire x1="2.54" y1="-15.24" x2="2.54" y2="-15.24" width="0.15" layer="94"/>
<wire x1="2.54" y1="-17.78" x2="2.54" y2="-17.78" width="0.15" layer="94"/>
<wire x1="2.54" y1="-20.32" x2="2.54" y2="-20.32" width="0.15" layer="94"/>
<wire x1="2.54" y1="-22.86" x2="2.54" y2="-22.86" width="0.15" layer="94"/>
<wire x1="2.54" y1="-25.4" x2="2.54" y2="-25.4" width="0.15" layer="94"/>
<wire x1="2.54" y1="-27.94" x2="2.54" y2="-27.94" width="0.15" layer="94"/>
<wire x1="2.54" y1="-30.48" x2="2.54" y2="-30.48" width="0.15" layer="94"/>
<wire x1="2.54" y1="-33.02" x2="2.54" y2="-33.02" width="0.15" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="2.54" y2="-7.62" width="0.15" layer="94"/>
<wire x1="25.4" y1="-40.64" x2="25.4" y2="-40.64" width="0.15" layer="94"/>
<wire x1="25.4" y1="-15.24" x2="25.4" y2="-15.24" width="0.15" layer="94"/>
<wire x1="25.4" y1="-17.78" x2="25.4" y2="-17.78" width="0.15" layer="94"/>
<wire x1="25.4" y1="-20.32" x2="25.4" y2="-20.32" width="0.15" layer="94"/>
<wire x1="25.4" y1="-22.86" x2="25.4" y2="-22.86" width="0.15" layer="94"/>
<wire x1="25.4" y1="-25.4" x2="25.4" y2="-25.4" width="0.15" layer="94"/>
<wire x1="25.4" y1="-27.94" x2="25.4" y2="-27.94" width="0.15" layer="94"/>
<wire x1="25.4" y1="-30.48" x2="25.4" y2="-30.48" width="0.15" layer="94"/>
<wire x1="25.4" y1="-33.02" x2="25.4" y2="-33.02" width="0.15" layer="94"/>
<text x="2.54" y="-2.54" size="2.54" layer="95" align="top-left">&gt;NAME</text>
<text x="2.54" y="-45.72" size="2.54" layer="95" align="top-left">SN74HCT541N</text>
<pin name="!OE1!" x="-2.54" y="-38.1" length="middle" direction="in"/>
<pin name="!OE2!" x="-2.54" y="-40.64" length="middle" direction="in"/>
<pin name="A1" x="-2.54" y="-15.24" length="middle" direction="in"/>
<pin name="A2" x="-2.54" y="-17.78" length="middle" direction="in"/>
<pin name="A3" x="-2.54" y="-20.32" length="middle" direction="in"/>
<pin name="A4" x="-2.54" y="-22.86" length="middle" direction="in"/>
<pin name="A5" x="-2.54" y="-25.4" length="middle" direction="in"/>
<pin name="A6" x="-2.54" y="-27.94" length="middle" direction="in"/>
<pin name="A7" x="-2.54" y="-30.48" length="middle" direction="in"/>
<pin name="A8" x="-2.54" y="-33.02" length="middle" direction="in"/>
<pin name="VCC" x="-2.54" y="-7.62" length="middle" direction="pwr"/>
<pin name="GND" x="30.48" y="-40.64" length="middle" direction="pwr" rot="R180"/>
<pin name="Y1" x="30.48" y="-15.24" length="middle" direction="out" rot="R180"/>
<pin name="Y2" x="30.48" y="-17.78" length="middle" direction="out" rot="R180"/>
<pin name="Y3" x="30.48" y="-20.32" length="middle" direction="out" rot="R180"/>
<pin name="Y4" x="30.48" y="-22.86" length="middle" direction="out" rot="R180"/>
<pin name="Y5" x="30.48" y="-25.4" length="middle" direction="out" rot="R180"/>
<pin name="Y6" x="30.48" y="-27.94" length="middle" direction="out" rot="R180"/>
<pin name="Y7" x="30.48" y="-30.48" length="middle" direction="out" rot="R180"/>
<pin name="Y8" x="30.48" y="-33.02" length="middle" direction="out" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TEXAS_INSTRUMENTS_SN74HCT541N" prefix="U">
<description>Buffer, Non-Inverting 1 Element 8 Bit per Element 3-State Output 20-PDIP</description>
<gates>
<gate name="G$0" symbol="TEXAS_INSTRUMENTS_SN74HCT541N_0_0" x="0" y="0"/>
</gates>
<devices>
<device name="TEXAS_INSTRUMENTS_SN74HCT541N_0_0" package="TEXAS_INSTRUMENTS_SN74HCT541N_0">
<connects>
<connect gate="G$0" pin="!OE1!" pad="1"/>
<connect gate="G$0" pin="!OE2!" pad="19"/>
<connect gate="G$0" pin="A1" pad="2"/>
<connect gate="G$0" pin="A2" pad="3"/>
<connect gate="G$0" pin="A3" pad="4"/>
<connect gate="G$0" pin="A4" pad="5"/>
<connect gate="G$0" pin="A5" pad="6"/>
<connect gate="G$0" pin="A6" pad="7"/>
<connect gate="G$0" pin="A7" pad="8"/>
<connect gate="G$0" pin="A8" pad="9"/>
<connect gate="G$0" pin="GND" pad="10"/>
<connect gate="G$0" pin="VCC" pad="20"/>
<connect gate="G$0" pin="Y1" pad="18"/>
<connect gate="G$0" pin="Y2" pad="17"/>
<connect gate="G$0" pin="Y3" pad="16"/>
<connect gate="G$0" pin="Y4" pad="15"/>
<connect gate="G$0" pin="Y5" pad="14"/>
<connect gate="G$0" pin="Y6" pad="13"/>
<connect gate="G$0" pin="Y7" pad="12"/>
<connect gate="G$0" pin="Y8" pad="11"/>
</connects>
<technologies>
<technology name="">
<attribute name="AMBIENT_TEMPERATURE_RANGE_HIGH" value="+85°C"/>
<attribute name="AMBIENT_TEMPERATURE_RANGE_LOW" value="-40°C"/>
<attribute name="AUTOMOTIVE" value="No"/>
<attribute name="CENTROID_NOT_SPECIFIED" value="No"/>
<attribute name="DATASHEET" value="http://www-s.ti.com/sc/ds/sn74hct541.pdf"/>
<attribute name="DEVICE_CLASS_L1" value="Integrated Circuits (ICs)"/>
<attribute name="DEVICE_CLASS_L2" value="Logic ICs"/>
<attribute name="DEVICE_CLASS_L3" value="Buffers"/>
<attribute name="DIGIKEY_DESCRIPTION" value="IC BUF NON-INVERT 5.5V 20DIP"/>
<attribute name="DIGIKEY_PART_NUMBER" value="296-1619-5-ND"/>
<attribute name="FOOTPRINT_PARAMETERS_0" value="{&quot;fp_type&quot;:&quot;DIP&quot;,&quot;params&quot;:{&quot;N&quot;:{&quot;nom&quot;:20,&quot;long name&quot;:&quot;Number of leads&quot;,&quot;min&quot;:null,&quot;max&quot;:null,&quot;short name&quot;:&quot;N&quot;,&quot;type&quot;:&quot;count&quot;},&quot;A&quot;:{&quot;nom&quot;:false,&quot;long name&quot;:&quot;Height&quot;,&quot;min&quot;:false,&quot;max&quot;:5080000,&quot;short name&quot;:&quot;A&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;A1&quot;:{&quot;nom&quot;:false,&quot;long name&quot;:&quot;Package clearance&quot;,&quot;min&quot;:510000,&quot;max&quot;:false,&quot;short name&quot;:&quot;A1&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;A2&quot;:{&quot;nom&quot;:false,&quot;long name&quot;:&quot;Package height&quot;,&quot;min&quot;:false,&quot;max&quot;:4570000,&quot;short name&quot;:&quot;A2&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;D&quot;:{&quot;nom&quot;:25400000,&quot;long name&quot;:&quot;Package length&quot;,&quot;min&quot;:23880000,&quot;max&quot;:26920000,&quot;short name&quot;:&quot;D&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;E&quot;:{&quot;nom&quot;:7940000,&quot;long name&quot;:&quot;Width w/ leads&quot;,&quot;min&quot;:7620000,&quot;max&quot;:8260000,&quot;short name&quot;:&quot;E&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;E1&quot;:{&quot;nom&quot;:6350000,&quot;long name&quot;:&quot;Package width&quot;,&quot;min&quot;:6100000,&quot;max&quot;:6600000,&quot;short name&quot;:&quot;E1&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;B&quot;:{&quot;nom&quot;:455000,&quot;long name&quot;:&quot;Lead width&quot;,&quot;min&quot;:380000,&quot;max&quot;:530000,&quot;short name&quot;:&quot;B&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;C&quot;:{&quot;nom&quot;:250000,&quot;long name&quot;:&quot;Lead thickness&quot;,&quot;min&quot;:false,&quot;max&quot;:false,&quot;short name&quot;:&quot;C&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;e&quot;:{&quot;nom&quot;:2540000,&quot;long name&quot;:&quot;Lead pitch&quot;,&quot;min&quot;:null,&quot;max&quot;:null,&quot;short name&quot;:&quot;e&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;offset x&quot;:{&quot;nom&quot;:0,&quot;long name&quot;:&quot;X Center offset&quot;,&quot;min&quot;:null,&quot;max&quot;:null,&quot;short name&quot;:&quot;offset x&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;offset y&quot;:{&quot;nom&quot;:0,&quot;long name&quot;:&quot;Y Center offset&quot;,&quot;min&quot;:null,&quot;max&quot;:null,&quot;short name&quot;:&quot;offset y&quot;,&quot;type&quot;:&quot;measurement&quot;},&quot;LS&quot;:{&quot;default&quot;:&quot;Circle&quot;,&quot;long name&quot;:&quot;Land shape&quot;,&quot;type&quot;:&quot;multichoice&quot;,&quot;short name&quot;:&quot;LS&quot;},&quot;LS1&quot;:{&quot;default&quot;:&quot;Square&quot;,&quot;long name&quot;:&quot;Land shape (Pin 1)&quot;,&quot;type&quot;:&quot;multichoice&quot;,&quot;short name&quot;:&quot;LS1&quot;}}}"/>
<attribute name="FOOTPRINT_VARIANT_NAME_0" value="Recommended_Land_Pattern"/>
<attribute name="HEIGHT" value="5.08mm"/>
<attribute name="LEAD_FREE" value="Yes"/>
<attribute name="LOGIC_FUNCTION_DESC" value="Non-Inverting"/>
<attribute name="MAX_SUPPLY_VOLTAGE" value="5.5V"/>
<attribute name="MF" value="Texas Instruments"/>
<attribute name="MFG_PACKAGE_IDENT" value="N0020A"/>
<attribute name="MFG_PACKAGE_IDENT_COMPONENT_ID" value="19cf7ba8c238dfd4"/>
<attribute name="MFG_PACKAGE_IDENT_DATE" value="0"/>
<attribute name="MFG_PACKAGE_IDENT_REV" value="0"/>
<attribute name="MIN_SUPPLY_VOLTAGE" value="4.5V"/>
<attribute name="MOUSER_DESCRIPTION" value="Buffers &amp; Line Drivers Octal Buffer/Line  "/>
<attribute name="MOUSER_PART_NUMBER" value="595-SN74HCT541N"/>
<attribute name="MPN" value="SN74HCT541N"/>
<attribute name="NOMINAL_SUPPLY_CURRENT" value="80uA"/>
<attribute name="NUMBER_OF_CIRCUITS" value="1"/>
<attribute name="NUMBER_OF_INPUTS" value="8"/>
<attribute name="NUMBER_OF_OUTPUTS" value="8"/>
<attribute name="PACKAGE" value="PDIP20"/>
<attribute name="PREFIX" value="U"/>
<attribute name="PROPAGATION_DELAY" value="19ns"/>
<attribute name="ROHS" value="Yes"/>
<attribute name="STANDOFF_HEIGHT" value="0.51mm"/>
<attribute name="TEMPERATURE_RANGE_HIGH" value="+85°C"/>
<attribute name="TEMPERATURE_RANGE_LOW" value="-40°C"/>
<attribute name="VERIFICATION_VERSION" value="0.0.0.3"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="X1" library="rpi_hat" deviceset="RPI_CONDENSED" device="ZERO"/>
<part name="TOLEDS" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-2X8" device="" package3d_urn="urn:adsk.eagle:package:22481/2"/>
<part name="GPIO16-23" library="Texas Instruments - SN74HCT541N" deviceset="TEXAS_INSTRUMENTS_SN74HCT541N" device="TEXAS_INSTRUMENTS_SN74HCT541N_0_0"/>
<part name="GPIO8-15" library="Texas Instruments - SN74HCT541N" deviceset="TEXAS_INSTRUMENTS_SN74HCT541N" device="TEXAS_INSTRUMENTS_SN74HCT541N_0_0"/>
<part name="TEST" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="GND" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X2" device="" package3d_urn="urn:adsk.eagle:package:22435/2"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="X1" gate="G$1" x="45.72" y="60.96" smashed="yes">
<attribute name="NAME" x="22.86" y="84.328" size="1.27" layer="95"/>
<attribute name="VALUE" x="22.86" y="36.322" size="1.27" layer="96"/>
</instance>
<instance part="TOLEDS" gate="A" x="142.24" y="58.42" smashed="yes">
<attribute name="NAME" x="135.89" y="69.469" size="1.778" layer="95"/>
<attribute name="VALUE" x="135.89" y="43.18" size="1.778" layer="96"/>
</instance>
<instance part="GPIO16-23" gate="G$0" x="40.64" y="27.94" smashed="yes">
<attribute name="NAME" x="43.18" y="25.654" size="1.9304" layer="95" align="top-left"/>
</instance>
<instance part="GPIO8-15" gate="G$0" x="86.36" y="81.28" smashed="yes">
<attribute name="NAME" x="88.9" y="78.994" size="1.9304" layer="95" align="top-left"/>
</instance>
<instance part="TEST" gate="A" x="5.08" y="86.36" smashed="yes">
<attribute name="NAME" x="-1.27" y="92.329" size="1.778" layer="95"/>
<attribute name="VALUE" x="-1.27" y="78.74" size="1.778" layer="96"/>
</instance>
<instance part="GND" gate="G$1" x="12.7" y="-15.24" smashed="yes">
<attribute name="NAME" x="6.35" y="-9.271" size="1.778" layer="95"/>
<attribute name="VALUE" x="6.35" y="-20.32" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="SD0" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO8@24"/>
<wire x1="68.58" y1="66.04" x2="83.82" y2="66.04" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A1"/>
</segment>
</net>
<net name="SD1" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO9@21"/>
<wire x1="68.58" y1="63.5" x2="83.82" y2="63.5" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A2"/>
</segment>
</net>
<net name="SD2" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO10@19"/>
<wire x1="68.58" y1="60.96" x2="83.82" y2="60.96" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A3"/>
</segment>
</net>
<net name="SD3" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO11@23"/>
<wire x1="68.58" y1="58.42" x2="83.82" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A4"/>
</segment>
</net>
<net name="SD4" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO12@32"/>
<wire x1="68.58" y1="55.88" x2="83.82" y2="55.88" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A5"/>
</segment>
</net>
<net name="SD5" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO13@33"/>
<wire x1="68.58" y1="53.34" x2="83.82" y2="53.34" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A6"/>
</segment>
</net>
<net name="SD6" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO14@8"/>
<wire x1="68.58" y1="50.8" x2="83.82" y2="50.8" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A7"/>
</segment>
</net>
<net name="SD7" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO15@10"/>
<wire x1="68.58" y1="48.26" x2="83.82" y2="48.26" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="A8"/>
</segment>
</net>
<net name="SD15" class="0">
<segment>
<wire x1="38.1" y1="-5.08" x2="12.7" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="12.7" y1="-5.08" x2="12.7" y2="50.8" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="GPIO23@16"/>
<wire x1="12.7" y1="50.8" x2="20.32" y2="50.8" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A8"/>
</segment>
</net>
<net name="SD14" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO22@15"/>
<wire x1="20.32" y1="53.34" x2="10.16" y2="53.34" width="0.1524" layer="91"/>
<wire x1="10.16" y1="53.34" x2="10.16" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="10.16" y1="-2.54" x2="38.1" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A7"/>
</segment>
</net>
<net name="SD13" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO21@40"/>
<wire x1="20.32" y1="55.88" x2="7.62" y2="55.88" width="0.1524" layer="91"/>
<wire x1="7.62" y1="55.88" x2="7.62" y2="0" width="0.1524" layer="91"/>
<wire x1="7.62" y1="0" x2="38.1" y2="0" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A6"/>
</segment>
</net>
<net name="SD12" class="0">
<segment>
<wire x1="38.1" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="91"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="58.42" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="GPIO20@38"/>
<wire x1="5.08" y1="58.42" x2="20.32" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A5"/>
</segment>
</net>
<net name="SD11" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO19@35"/>
<wire x1="20.32" y1="60.96" x2="12.7" y2="60.96" width="0.1524" layer="91"/>
<wire x1="12.7" y1="60.96" x2="2.54" y2="60.96" width="0.1524" layer="91"/>
<wire x1="2.54" y1="60.96" x2="2.54" y2="5.08" width="0.1524" layer="91"/>
<wire x1="2.54" y1="5.08" x2="38.1" y2="5.08" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A4"/>
<pinref part="TEST" gate="A" pin="2"/>
<wire x1="2.54" y1="86.36" x2="12.7" y2="86.36" width="0.1524" layer="91"/>
<wire x1="12.7" y1="86.36" x2="12.7" y2="60.96" width="0.1524" layer="91"/>
<junction x="12.7" y="60.96"/>
<label x="12.7" y="63.5" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="SD8" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO16@36"/>
<wire x1="68.58" y1="45.72" x2="76.2" y2="45.72" width="0.1524" layer="91"/>
<wire x1="76.2" y1="45.72" x2="76.2" y2="27.94" width="0.1524" layer="91"/>
<wire x1="76.2" y1="27.94" x2="35.56" y2="27.94" width="0.1524" layer="91"/>
<wire x1="35.56" y1="27.94" x2="35.56" y2="12.7" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A1"/>
<wire x1="35.56" y1="12.7" x2="38.1" y2="12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD10" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO18@12"/>
<wire x1="68.58" y1="40.64" x2="71.12" y2="40.64" width="0.1524" layer="91"/>
<wire x1="71.12" y1="40.64" x2="71.12" y2="33.02" width="0.1524" layer="91"/>
<wire x1="71.12" y1="33.02" x2="30.48" y2="33.02" width="0.1524" layer="91"/>
<wire x1="30.48" y1="33.02" x2="30.48" y2="7.62" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A3"/>
<wire x1="30.48" y1="7.62" x2="38.1" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD9" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GPIO17@11"/>
<wire x1="68.58" y1="43.18" x2="73.66" y2="43.18" width="0.1524" layer="91"/>
<wire x1="73.66" y1="43.18" x2="73.66" y2="30.48" width="0.1524" layer="91"/>
<wire x1="73.66" y1="30.48" x2="33.02" y2="30.48" width="0.1524" layer="91"/>
<wire x1="33.02" y1="30.48" x2="33.02" y2="10.16" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="A2"/>
<wire x1="33.02" y1="10.16" x2="38.1" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWR" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="5V0"/>
<wire x1="20.32" y1="81.28" x2="15.24" y2="81.28" width="0.1524" layer="91"/>
<wire x1="15.24" y1="81.28" x2="15.24" y2="20.32" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="VCC"/>
<wire x1="15.24" y1="20.32" x2="38.1" y2="20.32" width="0.1524" layer="91"/>
<wire x1="15.24" y1="81.28" x2="15.24" y2="86.36" width="0.1524" layer="91"/>
<junction x="15.24" y="81.28"/>
<wire x1="15.24" y1="86.36" x2="78.74" y2="86.36" width="0.1524" layer="91"/>
<wire x1="78.74" y1="86.36" x2="78.74" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="VCC"/>
<wire x1="78.74" y1="73.66" x2="83.82" y2="73.66" width="0.1524" layer="91"/>
<pinref part="TEST" gate="A" pin="1"/>
<wire x1="2.54" y1="88.9" x2="15.24" y2="88.9" width="0.1524" layer="91"/>
<wire x1="15.24" y1="88.9" x2="15.24" y2="86.36" width="0.1524" layer="91"/>
<junction x="15.24" y="86.36"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="GND"/>
<wire x1="20.32" y1="76.2" x2="10.16" y2="76.2" width="0.1524" layer="91"/>
<wire x1="10.16" y1="76.2" x2="0" y2="76.2" width="0.1524" layer="91"/>
<wire x1="0" y1="76.2" x2="0" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="0" y1="-22.86" x2="17.78" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="17.78" y1="-22.86" x2="20.32" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="20.32" y1="-22.86" x2="33.02" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-22.86" x2="35.56" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="35.56" y1="-22.86" x2="73.66" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-22.86" x2="73.66" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="GND"/>
<wire x1="73.66" y1="-12.7" x2="71.12" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="GND"/>
<wire x1="116.84" y1="40.64" x2="119.38" y2="40.64" width="0.1524" layer="91"/>
<wire x1="119.38" y1="40.64" x2="119.38" y2="22.86" width="0.1524" layer="91"/>
<wire x1="119.38" y1="22.86" x2="81.28" y2="22.86" width="0.1524" layer="91"/>
<wire x1="81.28" y1="22.86" x2="78.74" y2="22.86" width="0.1524" layer="91"/>
<wire x1="78.74" y1="22.86" x2="73.66" y2="22.86" width="0.1524" layer="91"/>
<wire x1="73.66" y1="22.86" x2="73.66" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="!OE1!"/>
<wire x1="83.82" y1="43.18" x2="78.74" y2="43.18" width="0.1524" layer="91"/>
<wire x1="78.74" y1="43.18" x2="78.74" y2="22.86" width="0.1524" layer="91"/>
<junction x="78.74" y="22.86"/>
<pinref part="GPIO8-15" gate="G$0" pin="!OE2!"/>
<wire x1="83.82" y1="40.64" x2="81.28" y2="40.64" width="0.1524" layer="91"/>
<wire x1="81.28" y1="40.64" x2="81.28" y2="22.86" width="0.1524" layer="91"/>
<junction x="81.28" y="22.86"/>
<pinref part="GPIO16-23" gate="G$0" pin="!OE2!"/>
<wire x1="38.1" y1="-12.7" x2="35.56" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="35.56" y1="-12.7" x2="35.56" y2="-22.86" width="0.1524" layer="91"/>
<junction x="35.56" y="-22.86"/>
<pinref part="GPIO16-23" gate="G$0" pin="!OE1!"/>
<wire x1="38.1" y1="-10.16" x2="33.02" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-10.16" x2="33.02" y2="-22.86" width="0.1524" layer="91"/>
<junction x="33.02" y="-22.86"/>
<pinref part="TEST" gate="A" pin="3"/>
<wire x1="2.54" y1="83.82" x2="10.16" y2="83.82" width="0.1524" layer="91"/>
<wire x1="10.16" y1="83.82" x2="10.16" y2="76.2" width="0.1524" layer="91"/>
<junction x="10.16" y="76.2"/>
<pinref part="GND" gate="G$1" pin="2"/>
<wire x1="10.16" y1="-15.24" x2="17.78" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="17.78" y1="-15.24" x2="17.78" y2="-22.86" width="0.1524" layer="91"/>
<junction x="17.78" y="-22.86"/>
<pinref part="GND" gate="G$1" pin="1"/>
<wire x1="10.16" y1="-12.7" x2="20.32" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="20.32" y1="-12.7" x2="20.32" y2="-22.86" width="0.1524" layer="91"/>
<junction x="20.32" y="-22.86"/>
</segment>
</net>
<net name="SD0_5V" class="0">
<segment>
<pinref part="GPIO8-15" gate="G$0" pin="Y1"/>
<pinref part="TOLEDS" gate="A" pin="1"/>
<wire x1="116.84" y1="66.04" x2="139.7" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD1_5V" class="0">
<segment>
<pinref part="GPIO8-15" gate="G$0" pin="Y2"/>
<wire x1="116.84" y1="63.5" x2="119.38" y2="63.5" width="0.1524" layer="91"/>
<wire x1="119.38" y1="63.5" x2="119.38" y2="73.66" width="0.1524" layer="91"/>
<wire x1="119.38" y1="73.66" x2="157.48" y2="73.66" width="0.1524" layer="91"/>
<wire x1="157.48" y1="73.66" x2="157.48" y2="66.04" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="2"/>
<wire x1="157.48" y1="66.04" x2="147.32" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD2_5V" class="0">
<segment>
<pinref part="GPIO8-15" gate="G$0" pin="Y3"/>
<wire x1="116.84" y1="60.96" x2="121.92" y2="60.96" width="0.1524" layer="91"/>
<wire x1="121.92" y1="60.96" x2="121.92" y2="63.5" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="3"/>
<wire x1="121.92" y1="63.5" x2="139.7" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD3_5V" class="0">
<segment>
<pinref part="GPIO8-15" gate="G$0" pin="Y4"/>
<wire x1="116.84" y1="58.42" x2="124.46" y2="58.42" width="0.1524" layer="91"/>
<wire x1="124.46" y1="58.42" x2="124.46" y2="76.2" width="0.1524" layer="91"/>
<wire x1="124.46" y1="76.2" x2="160.02" y2="76.2" width="0.1524" layer="91"/>
<wire x1="160.02" y1="76.2" x2="160.02" y2="63.5" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="4"/>
<wire x1="160.02" y1="63.5" x2="147.32" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD4_5V" class="0">
<segment>
<pinref part="GPIO8-15" gate="G$0" pin="Y5"/>
<wire x1="116.84" y1="55.88" x2="127" y2="55.88" width="0.1524" layer="91"/>
<wire x1="127" y1="55.88" x2="127" y2="60.96" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="5"/>
<wire x1="127" y1="60.96" x2="139.7" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD5_5V" class="0">
<segment>
<wire x1="124.46" y1="43.18" x2="157.48" y2="43.18" width="0.1524" layer="91"/>
<wire x1="157.48" y1="43.18" x2="157.48" y2="60.96" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="6"/>
<wire x1="157.48" y1="60.96" x2="147.32" y2="60.96" width="0.1524" layer="91"/>
<pinref part="GPIO8-15" gate="G$0" pin="Y6"/>
<wire x1="116.84" y1="53.34" x2="124.46" y2="53.34" width="0.1524" layer="91"/>
<wire x1="124.46" y1="43.18" x2="124.46" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD6_5V" class="0">
<segment>
<pinref part="GPIO8-15" gate="G$0" pin="Y7"/>
<wire x1="116.84" y1="50.8" x2="127" y2="50.8" width="0.1524" layer="91"/>
<wire x1="127" y1="50.8" x2="127" y2="53.34" width="0.1524" layer="91"/>
<wire x1="127" y1="53.34" x2="129.54" y2="53.34" width="0.1524" layer="91"/>
<wire x1="129.54" y1="53.34" x2="129.54" y2="58.42" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="7"/>
<wire x1="129.54" y1="58.42" x2="139.7" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD8_5V" class="0">
<segment>
<wire x1="132.08" y1="12.7" x2="132.08" y2="55.88" width="0.1524" layer="91"/>
<pinref part="GPIO16-23" gate="G$0" pin="Y1"/>
<wire x1="132.08" y1="12.7" x2="71.12" y2="12.7" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="9"/>
<wire x1="132.08" y1="55.88" x2="139.7" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD7_5V" class="0">
<segment>
<pinref part="GPIO8-15" gate="G$0" pin="Y8"/>
<wire x1="116.84" y1="48.26" x2="121.92" y2="48.26" width="0.1524" layer="91"/>
<wire x1="121.92" y1="48.26" x2="121.92" y2="40.64" width="0.1524" layer="91"/>
<wire x1="121.92" y1="40.64" x2="160.02" y2="40.64" width="0.1524" layer="91"/>
<wire x1="160.02" y1="40.64" x2="160.02" y2="58.42" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="8"/>
<wire x1="160.02" y1="58.42" x2="147.32" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD_10_5V" class="0">
<segment>
<pinref part="GPIO16-23" gate="G$0" pin="Y3"/>
<wire x1="71.12" y1="7.62" x2="129.54" y2="7.62" width="0.1524" layer="91"/>
<wire x1="129.54" y1="7.62" x2="129.54" y2="50.8" width="0.1524" layer="91"/>
<wire x1="129.54" y1="50.8" x2="134.62" y2="50.8" width="0.1524" layer="91"/>
<wire x1="134.62" y1="50.8" x2="134.62" y2="53.34" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="11"/>
<wire x1="134.62" y1="53.34" x2="139.7" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD11_5V" class="0">
<segment>
<pinref part="GPIO16-23" gate="G$0" pin="Y4"/>
<wire x1="71.12" y1="5.08" x2="152.4" y2="5.08" width="0.1524" layer="91"/>
<wire x1="152.4" y1="5.08" x2="152.4" y2="53.34" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="12"/>
<wire x1="152.4" y1="53.34" x2="147.32" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD12_5V" class="0">
<segment>
<pinref part="GPIO16-23" gate="G$0" pin="Y5"/>
<wire x1="71.12" y1="2.54" x2="134.62" y2="2.54" width="0.1524" layer="91"/>
<wire x1="134.62" y1="2.54" x2="134.62" y2="48.26" width="0.1524" layer="91"/>
<wire x1="134.62" y1="48.26" x2="137.16" y2="48.26" width="0.1524" layer="91"/>
<wire x1="137.16" y1="48.26" x2="137.16" y2="50.8" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="13"/>
<wire x1="137.16" y1="50.8" x2="139.7" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD13_5V" class="0">
<segment>
<pinref part="GPIO16-23" gate="G$0" pin="Y6"/>
<wire x1="71.12" y1="0" x2="162.56" y2="0" width="0.1524" layer="91"/>
<wire x1="162.56" y1="0" x2="162.56" y2="50.8" width="0.1524" layer="91"/>
<wire x1="162.56" y1="50.8" x2="147.32" y2="50.8" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="14"/>
</segment>
</net>
<net name="SD14_5V" class="0">
<segment>
<pinref part="GPIO16-23" gate="G$0" pin="Y7"/>
<wire x1="71.12" y1="-2.54" x2="139.7" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="15"/>
<wire x1="139.7" y1="-2.54" x2="139.7" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD15_5V" class="0">
<segment>
<pinref part="GPIO16-23" gate="G$0" pin="Y8"/>
<wire x1="71.12" y1="-5.08" x2="149.86" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="149.86" y1="-5.08" x2="149.86" y2="48.26" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="16"/>
<wire x1="149.86" y1="48.26" x2="147.32" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SD9_5V" class="0">
<segment>
<pinref part="GPIO16-23" gate="G$0" pin="Y2"/>
<wire x1="71.12" y1="10.16" x2="154.94" y2="10.16" width="0.1524" layer="91"/>
<wire x1="154.94" y1="10.16" x2="154.94" y2="55.88" width="0.1524" layer="91"/>
<pinref part="TOLEDS" gate="A" pin="10"/>
<wire x1="154.94" y1="55.88" x2="147.32" y2="55.88" width="0.1524" layer="91"/>
<label x="55.88" y="25.4" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
