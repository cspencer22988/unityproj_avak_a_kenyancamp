Shader "Lockwood/Mobile/VertexBlend_2Tex" {
	Properties {
		_MainTex ("Texture 1 (paint 0 alpha)", 2D) = "white" {}
		_Texture2 ("Texture 2 (paint 1 alpha)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		Pass {
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 44624
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2(-((unity_FogParams.y * tmpvar_3.z)));
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp float tmpvar_5;
					  tmpvar_5 = (unity_FogParams.x * tmpvar_3.z);
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2((-(tmpvar_5) * tmpvar_5));
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp float tmpvar_5;
					  tmpvar_5 = (unity_FogParams.x * tmpvar_3.z);
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2((-(tmpvar_5) * tmpvar_5));
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  highp float tmpvar_5;
					  tmpvar_5 = (unity_FogParams.x * tmpvar_3.z);
					  tmpvar_2 = tmpvar_1;
					  gl_Position = tmpvar_3;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2((-(tmpvar_5) * tmpvar_5));
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "META" "RenderType" = "Opaque" }
			Cull Off
			GpuProgramID 91770
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = mix (tmpvar_5.xyz, tmpvar_4.xyz, xlv_COLOR0.www);
					  tex_1 = tmpvar_6;
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_7;
					  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = tmpvar_2;
					    res_7.w = tmpvar_8.w;
					    highp vec3 tmpvar_9;
					    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_7.xyz = tmpvar_9;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_10;
					    if (bool(unity_UseLinearSpace)) {
					      emission_10 = tmpvar_3;
					    } else {
					      emission_10 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = emission_10;
					    res_7 = tmpvar_11;
					  };
					  gl_FragData[0] = res_7;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = mix (tmpvar_5.xyz, tmpvar_4.xyz, xlv_COLOR0.www);
					  tex_1 = tmpvar_6;
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_7;
					  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = tmpvar_2;
					    res_7.w = tmpvar_8.w;
					    highp vec3 tmpvar_9;
					    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_7.xyz = tmpvar_9;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_10;
					    if (bool(unity_UseLinearSpace)) {
					      emission_10 = tmpvar_3;
					    } else {
					      emission_10 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = emission_10;
					    res_7 = tmpvar_11;
					  };
					  gl_FragData[0] = res_7;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  xlv_TEXCOORD2 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD1);
					  mediump vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = mix (tmpvar_5.xyz, tmpvar_4.xyz, xlv_COLOR0.www);
					  tex_1 = tmpvar_6;
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_7;
					  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = tmpvar_2;
					    res_7.w = tmpvar_8.w;
					    highp vec3 tmpvar_9;
					    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_7.xyz = tmpvar_9;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_10;
					    if (bool(unity_UseLinearSpace)) {
					      emission_10 = tmpvar_3;
					    } else {
					      emission_10 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = emission_10;
					    res_7 = tmpvar_11;
					  };
					  gl_FragData[0] = res_7;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
	}
	Fallback "Lockwood/Diffuse"
}