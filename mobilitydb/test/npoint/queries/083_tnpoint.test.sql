﻿-------------------------------------------------------------------------------
--
-- This MobilityDB code is provided under The PostgreSQL License.
-- Copyright (c) 2016-2025, Université libre de Bruxelles and MobilityDB
-- contributors
--
-- MobilityDB includes portions of PostGIS version 3 source code released
-- under the GNU General Public License (GPLv2 or later).
-- Copyright (c) 2001-2025, PostGIS contributors
--
-- Permission to use, copy, modify, and distribute this software and its
-- documentation for any purpose, without fee, and without a written
-- agreement is hereby granted, provided that the above copyright notice and
-- this paragraph and the following two paragraphs appear in all copies.
--
-- IN NO EVENT SHALL UNIVERSITE LIBRE DE BRUXELLES BE LIABLE TO ANY PARTY FOR
-- DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING
-- LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
-- EVEN IF UNIVERSITE LIBRE DE BRUXELLES HAS BEEN ADVISED OF THE POSSIBILITY
-- OF SUCH DAMAGE.
--
-- UNIVERSITE LIBRE DE BRUXELLES SPECIFICALLY DISCLAIMS ANY WARRANTIES,
-- INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
-- AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON
-- AN "AS IS" BASIS, AND UNIVERSITE LIBRE DE BRUXELLES HAS NO OBLIGATIONS TO
-- PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Input
-------------------------------------------------------------------------------

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';
SELECT tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }';

SELECT tnpoint '  Npoint (  1  ,   0.5  )  @  2000-01-01  ';
SELECT tnpoint '  {  Npoint( 1 , 0.3 ) @ 2000-01-01  , Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5) @  2000-01-03   }   ';
SELECT tnpoint '  [  Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '  {  [  Npoint(1, 0.2)@2000-01-01 ,  Npoint ( 1 , 0.4 ) @2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

-- Normalization
SELECT tnpoint '[Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint'{[Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05, Npoint(2, 0.6)@2000-01-06]}';

-------------------------------------------------------------------------------
-- Input/output in WKT, WKB and HexWKB formats
-------------------------------------------------------------------------------

SELECT asText(tnpoint 'NPoint(1, 0.123456789)@2000-01-01', 6);
SELECT asText(tnpoint '{NPoint(1, 0.123456789)@2000-01-01, NPoint(1, 0.523456789)@2000-01-02, NPoint(1, 0.123456789)@2000-01-03}', 6);
SELECT asText(tnpoint '[NPoint(1, 0.123456789)@2000-01-01, NPoint(1, 0.523456789)@2000-01-02, NPoint(1, 0.123456789)@2000-01-03]', 6);
SELECT asText(tnpoint '{[NPoint(1, 0.123456789)@2000-01-01, NPoint(1, 0.523456789)@2000-01-02, NPoint(1, 0.123456789)@2000-01-03],[NPoint(2, 0.723456789)@2000-01-04, NPoint(2, 0.723456789)@2000-01-05]}', 6);
SELECT asText(tnpoint 'Interp=Step;[NPoint(1, 0.123456789)@2000-01-01, NPoint(1, 0.523456789)@2000-01-02, NPoint(1, 0.123456789)@2000-01-03]', 6);
SELECT asText(tnpoint 'Interp=Step;{[NPoint(1, 0.123456789)@2000-01-01, NPoint(1, 0.523456789)@2000-01-02, NPoint(1, 0.123456789)@2000-01-03],[NPoint(2, 0.723456789)@2000-01-04, NPoint(2, 0.723456789)@2000-01-05]}', 6);

-------------------------------------------------------------------------------
-- Maximum decimal digits

SELECT tnpointFromBinary(asBinary(tnpoint 'Npoint(1, 0.5)@2000-01-01'));
SELECT tnpointFromBinary(asBinary(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}'));
SELECT tnpointFromBinary(asBinary(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]'));
SELECT tnpointFromBinary(asBinary(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}'));
SELECT tnpointFromBinary(asBinary(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]'));
SELECT tnpointFromBinary(asBinary(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }'));

SELECT tnpointFromBinary(asBinary(tnpoint 'Npoint(1, 0.5)@2000-01-01', 'NDR'));
SELECT tnpointFromBinary(asBinary(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 'NDR'));
SELECT tnpointFromBinary(asBinary(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'NDR'));
SELECT tnpointFromBinary(asBinary(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 'NDR'));
SELECT tnpointFromBinary(asBinary(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'NDR'));
SELECT tnpointFromBinary(asBinary(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }', 'NDR'));

SELECT tnpointFromBinary(asBinary(tnpoint 'Npoint(1, 0.5)@2000-01-01', 'XDR'));
SELECT tnpointFromBinary(asBinary(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 'XDR'));
SELECT tnpointFromBinary(asBinary(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'XDR'));
SELECT tnpointFromBinary(asBinary(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 'XDR'));
SELECT tnpointFromBinary(asBinary(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'XDR'));
SELECT tnpointFromBinary(asBinary(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }', 'XDR'));

-------------------------------------------------------------------------------

SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Npoint(1, 0.5)@2000-01-01'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }'));

SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Npoint(1, 0.5)@2000-01-01', 'NDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 'NDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'NDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 'NDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'NDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }', 'NDR'));

SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Npoint(1, 0.5)@2000-01-01', 'XDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 'XDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'XDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 'XDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'XDR'));
SELECT tnpointFromHexWKB(asHexWKB(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }', 'XDR'));

-------------------------------------------------------------------------------
-- Constructors
-------------------------------------------------------------------------------

SELECT tnpoint('npoint(1,0)'::npoint, '2012-01-01'::timestamp);

SELECT tnpointSeq(ARRAY['npoint(1,0)@2012-01-01'::tnpoint, 'npoint(2,1)@2012-02-01'::tnpoint], 'discrete');

SELECT tnpointSeq(ARRAY['npoint(1,0)@2012-01-01'::tnpoint, 'npoint(1,1)@2012-02-01'::tnpoint], 'linear', true, false);
/* Error */
SELECT tnpointSeq(ARRAY['npoint(1,0)@2012-01-01'::tnpoint, 'npoint(2,1)@2012-02-01'::tnpoint], 'linear', true, false);

SELECT tnpointSeqSet(ARRAY[tnpoint '[npoint(1,0)@2012-01-01, npoint(1,1)@2012-02-01]', '[npoint(2,0)@2012-03-01, npoint(2,1)@2012-04-01]']);

-------------------------------------------------------------------------------
-- Transformation functions
-------------------------------------------------------------------------------

SELECT tnpointInst(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT setInterp(tnpoint 'Npoint(1, 0.5)@2000-01-01', 'discrete');
SELECT tnpointSeq(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT tnpointSeqSet(tnpoint 'Npoint(1, 0.5)@2000-01-01');

SELECT tnpointInst(tnpoint '{Npoint(1, 0.3)@2000-01-01}');
SELECT setInterp(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 'discrete');
SELECT tnpointSeq(tnpoint '{Npoint(1, 0.3)@2000-01-01}');
SELECT tnpointSeqSet(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');

SELECT tnpointInst(tnpoint '[Npoint(1, 0.3)@2000-01-01]');
SELECT setInterp(tnpoint '[Npoint(1, 0.3)@2000-01-01]', 'discrete');
SELECT tnpointSeq(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT tnpointSeqSet(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');

SELECT tnpointInst(tnpoint '{[Npoint(1, 0.3)@2000-01-01]}');
SELECT setInterp(tnpoint '{[Npoint(1, 0.3)@2000-01-01], [Npoint(2, 0.6)@2000-01-04]}', 'discrete');
SELECT tnpointSeq(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]}');
SELECT tnpointSeqSet(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT setInterp(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 'linear');
SELECT setInterp(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 'linear');

SELECT round(tnpoint '{[NPoint(1, 0.123456789)@2012-01-01, NPoint(1, 0.5)@2012-01-02)}', 6);

-------------------------------------------------------------------------------
-- Append functions
-------------------------------------------------------------------------------

SELECT appendInstant(tnpoint 'Npoint(1, 0.5)@2000-01-01', tnpoint 'Npoint(1, 0.7)@2000-01-02');
SELECT appendInstant(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tnpoint 'Npoint(1, 0.7)@2000-01-04');
SELECT appendInstant(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tnpoint 'Npoint(1, 0.7)@2000-01-04');
SELECT appendInstant(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }', tnpoint 'Npoint(2, 0.7)@2000-01-06');
/* Errors */
SELECT appendInstant(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tnpoint 'Npoint(2, 0.7)@2000-01-04');
SELECT appendInstant(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }', tnpoint 'Npoint(1, 0.7)@2000-01-06');

-------------------------------------------------------------------------------

SELECT appendSequence(tnpoint '{Npoint(1, 0.2)@2000-01-01, Npoint(2, 0.4)@2000-01-02}', tnpoint '{Npoint(3, 0.6)@2000-01-03}');
SELECT appendSequence(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02]', tnpoint '[Npoint(1, 0.6)@2000-01-03]');

/* Errors */
SELECT appendSequence(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02]', tnpoint '[Npoint(2, 0.6)@2000-01-03]');

-------------------------------------------------------------------------------
-- Conversion functions
-------------------------------------------------------------------------------

SELECT asText(round(tnpoint 'Npoint(1, 0.5)@2000-01-01'::tgeompoint, 6));
SELECT asText(round(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}'::tgeompoint, 6));
SELECT asText(round(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]'::tgeompoint, 6));
SELECT asText(round(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }'::tgeompoint, 6));

SELECT round((tnpoint 'Npoint(1, 0.5)@2000-01-01'::tgeompoint)::tnpoint, 6);
SELECT round((tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}'::tgeompoint)::tnpoint, 6);
SELECT round((tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]'::tgeompoint)::tnpoint, 6);
SELECT round((tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05] }'::tgeompoint)::tnpoint, 6);
-- NULL
SELECT tgeompoint 'SRID=5676;Point(-1 -1)@2000-01-01'::tnpoint;
SELECT tgeompoint 'SRID=5676;{POINT(48.7186629128278 77.7640705101509)@2000-01-01, POINT(48.71 77.76)@2000-01-02}'::tnpoint;
SELECT tgeompoint 'SRID=5676;[POINT(48.7186629128278 77.7640705101509)@2000-01-01, POINT(48.71 77.76)@2000-01-02]'::tnpoint;
SELECT tgeompoint 'SRID=5676;{[POINT(62.7866330839742 80.1435561997142)@2000-01-01, POINT(62.7866330839742 80.1435561997142)@2000-01-02],[POINT(48.7186629128278 77.7640705101509)@2000-01-03, POINT(48.71 77.76)@2000-01-04]}'::tnpoint;
/* Errors */
SELECT tgeompoint 'Point(-1 -1)@2000-01-01'::tnpoint;

-------------------------------------------------------------------------------
-- Accessor Functions
-------------------------------------------------------------------------------

SELECT tempSubtype(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT tempSubtype(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT tempSubtype(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT tempSubtype(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT memSize(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT memSize(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT memSize(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT memSize(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT getValue(tnpoint 'Npoint(1, 0.5)@2000-01-01');

SELECT getValues(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT getValues(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT getValues(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT getValues(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT positions(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT positions(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT positions(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT positions(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');
SELECT positions(tnpoint 'Interp=Step;[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT positions(tnpoint 'Interp=Step;{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT route(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT route(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
/* Errors */
SELECT route(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');

SELECT routes(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT routes(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT routes(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT routes(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT getTime(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT getTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT getTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT getTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT timeSpan(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT timeSpan(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT timeSpan(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT timeSpan(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT duration(tnpoint 'Npoint(1, 0.5)@2000-01-01', true);
SELECT duration(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', true);
SELECT duration(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', true);
SELECT duration(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', true);

SELECT duration(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT duration(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT duration(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT duration(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT getTimestamp(tnpoint 'Npoint(1, 0.5)@2000-01-01');

-------------------------------------------------------------------------------
-- Shift and scale functions
-------------------------------------------------------------------------------

SELECT shiftTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', '5 min');
SELECT shiftTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', '5 min');
SELECT shiftTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', '5 min');
SELECT shiftTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', '5 min');

SELECT shiftTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', '1 year'::interval);
SELECT shiftTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', '1 year'::interval);
SELECT shiftTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', '1 year'::interval);
SELECT shiftTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', '1 year'::interval);

SELECT scaleTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', '1 day');
SELECT scaleTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', '1 day');
SELECT scaleTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', '1 day');
SELECT scaleTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', '1 day');

-------------------------------------------------------------------------------
-- Ever/always comparison functions
-------------------------------------------------------------------------------

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' ?= npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' ?= npoint 'Npoint(1, 0.5)';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' ?= npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' ?= npoint 'Npoint(1, 0.5)';

SELECT npoint 'Npoint(1, 0.5)' ?= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT npoint 'Npoint(1, 0.5)' ?= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT npoint 'Npoint(1, 0.5)' ?= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT npoint 'Npoint(1, 0.5)' ?= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' %= npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' %= npoint 'Npoint(1, 0.5)';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' %= npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' %= npoint 'Npoint(1, 0.5)';

SELECT npoint 'Npoint(1, 0.5)' %= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT npoint 'Npoint(1, 0.5)' %= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT npoint 'Npoint(1, 0.5)' %= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT npoint 'Npoint(1, 0.5)' %= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

-------------------------------------------------------------------------------

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' ?<> npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' ?<> npoint 'Npoint(1, 0.5)';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' ?<> npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' ?<> npoint 'Npoint(1, 0.5)';

SELECT npoint 'Npoint(1, 0.5)' ?<> tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT npoint 'Npoint(1, 0.5)' ?<> tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT npoint 'Npoint(1, 0.5)' ?<> tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT npoint 'Npoint(1, 0.5)' ?<> tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' %<> npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' %<> npoint 'Npoint(1, 0.5)';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' %<> npoint 'Npoint(1, 0.5)';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' %<> npoint 'Npoint(1, 0.5)';

SELECT npoint 'Npoint(1, 0.5)' %<> tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT npoint 'Npoint(1, 0.5)' %<> tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT npoint 'Npoint(1, 0.5)' %<> tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT npoint 'Npoint(1, 0.5)' %<> tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

-------------------------------------------------------------------------------
-- Accessor functions
-------------------------------------------------------------------------------

SELECT startValue(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT startValue(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT startValue(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT startValue(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT endValue(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT endValue(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT endValue(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT endValue(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT valueN(tnpoint 'Npoint(1, 0.5)@2000-01-01', 1);
SELECT valueN(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 1);
SELECT valueN(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 1);
SELECT valueN(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 1);

SELECT numInstants(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT numInstants(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT numInstants(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT numInstants(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT startInstant(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT startInstant(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT startInstant(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT startInstant(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT endInstant(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT endInstant(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT endInstant(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT endInstant(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT instantN(tnpoint 'Npoint(1, 0.5)@2000-01-01', 1);
SELECT instantN(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 1);
SELECT instantN(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 1);
SELECT instantN(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 1);

SELECT instants(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT instants(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT instants(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT instants(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT numTimestamps(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT numTimestamps(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT numTimestamps(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT numTimestamps(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT startTimestamp(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT startTimestamp(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT startTimestamp(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT startTimestamp(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT endTimestamp(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT endTimestamp(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT endTimestamp(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT endTimestamp(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT timestampN(tnpoint 'Npoint(1, 0.5)@2000-01-01', 1);
SELECT timestampN(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 1);
SELECT timestampN(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 1);
SELECT timestampN(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 1);

SELECT timestamps(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT timestamps(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT timestamps(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT timestamps(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT numSequences(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');
SELECT startSequence(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');
SELECT endSequence(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');
SELECT sequenceN(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 1);
SELECT sequences(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT startTimestamp(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT startTimestamp(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT startTimestamp(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT startTimestamp(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT endTimestamp(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT endTimestamp(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT endTimestamp(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT endTimestamp(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

SELECT timestampN(tnpoint 'Npoint(1, 0.5)@2000-01-01', 1);
SELECT timestampN(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', 1);
SELECT timestampN(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', 1);
SELECT timestampN(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', 1);

SELECT timestamps(tnpoint 'Npoint(1, 0.5)@2000-01-01');
SELECT timestamps(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}');
SELECT timestamps(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]');
SELECT timestamps(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}');

-------------------------------------------------------------------------------
-- Restriction Functions
-------------------------------------------------------------------------------

SELECT atValues(tnpoint 'Npoint(1, 0.5)@2000-01-01', npoint 'Npoint(1, 0.5)');
SELECT atValues(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', npoint 'Npoint(1, 0.5)');
SELECT atValues(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', npoint 'Npoint(1, 0.5)');
SELECT atValues(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', npoint 'Npoint(1, 0.5)');

SELECT minusValues(tnpoint 'Npoint(1, 0.5)@2000-01-01', npoint 'Npoint(1, 0.5)');
SELECT minusValues(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', npoint 'Npoint(1, 0.5)');
SELECT minusValues(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', npoint 'Npoint(1, 0.5)');
SELECT minusValues(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', npoint 'Npoint(1, 0.5)');

SELECT atValues(tnpoint 'Npoint(1, 0.5)@2000-01-01', npointset '{"Npoint(1, 0.5)"}');
SELECT atValues(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', npointset '{"Npoint(1, 0.5)"}');
SELECT atValues(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', npointset '{"Npoint(1, 0.5)"}');
SELECT atValues(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', npointset '{"Npoint(1, 0.5)"}');

SELECT minusValues(tnpoint 'Npoint(1, 0.5)@2000-01-01', npointset '{"Npoint(1, 0.5)"}');
SELECT minusValues(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', npointset '{"Npoint(1, 0.5)"}');
SELECT minusValues(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', npointset '{"Npoint(1, 0.5)"}');
SELECT minusValues(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', npointset '{"Npoint(1, 0.5)"}');

SELECT atTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', timestamptz '2000-01-01');
SELECT atTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', timestamptz '2000-01-01');
SELECT atTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', timestamptz '2000-01-01');
SELECT atTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', timestamptz '2000-01-01');

SELECT valueAtTimestamp(tnpoint 'Npoint(1, 0.5)@2000-01-01', '2000-01-01');
SELECT valueAtTimestamp(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', '2000-01-01');
SELECT valueAtTimestamp(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', '2000-01-01');
SELECT valueAtTimestamp(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', '2000-01-01');

SELECT minusTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', timestamptz '2000-01-01');
SELECT minusTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', timestamptz '2000-01-01');
SELECT minusTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', timestamptz '2000-01-01');
SELECT minusTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', timestamptz '2000-01-01');

SELECT atTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzset '{2000-01-01}');
SELECT atTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzset '{2000-01-01}');
SELECT atTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzset '{2000-01-01}');
SELECT atTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzset '{2000-01-01}');

SELECT minusTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzset '{2000-01-01}');
SELECT minusTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzset '{2000-01-01}');
SELECT minusTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzset '{2000-01-01}');
SELECT minusTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzset '{2000-01-01}');

SELECT atTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzspan '[2000-01-01, 2000-01-02]');
SELECT atTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzspan '[2000-01-01, 2000-01-02]');
SELECT atTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzspan '[2000-01-01, 2000-01-02]');
SELECT atTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzspan '[2000-01-01, 2000-01-02]');

SELECT minusTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzspan '[2000-01-01, 2000-01-02]');
SELECT minusTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzspan '[2000-01-01, 2000-01-02]');
SELECT minusTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzspan '[2000-01-01, 2000-01-02]');
SELECT minusTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzspan '[2000-01-01, 2000-01-02]');

SELECT atTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT atTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT atTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT atTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzspanset '{[2000-01-01, 2000-01-02]}');

SELECT minusTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT minusTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT minusTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT minusTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzspanset '{[2000-01-01, 2000-01-02]}');

-------------------------------------------------------------------------------
-- Modification functions
-------------------------------------------------------------------------------

SELECT deleteTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', timestamptz '2000-01-01');
SELECT deleteTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', timestamptz '2000-01-01');
SELECT deleteTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', timestamptz '2000-01-01');
SELECT deleteTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', timestamptz '2000-01-01');

SELECT deleteTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzset '{2000-01-01}');
SELECT deleteTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzset '{2000-01-01}');
SELECT deleteTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzset '{2000-01-01}');
SELECT deleteTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzset '{2000-01-01}');

SELECT deleteTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzspan '[2000-01-01, 2000-01-02]');
SELECT deleteTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzspan '[2000-01-01, 2000-01-02]');
SELECT deleteTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzspan '[2000-01-01, 2000-01-02]');
SELECT deleteTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzspan '[2000-01-01, 2000-01-02]');

SELECT deleteTime(tnpoint 'Npoint(1, 0.5)@2000-01-01', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT deleteTime(tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT deleteTime(tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]', tstzspanset '{[2000-01-01, 2000-01-02]}');
SELECT deleteTime(tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}', tstzspanset '{[2000-01-01, 2000-01-02]}');

-------------------------------------------------------------------------------
-- Comparison functions and B-tree indexing
-------------------------------------------------------------------------------

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' = tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' = tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' = tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' = tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' = tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' = tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' = tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' = tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' = tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' = tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' = tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' = tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' = tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' = tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' = tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' = tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' != tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' != tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' != tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' != tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' != tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' != tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' != tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' != tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' != tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' != tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' != tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' != tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' != tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' != tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' != tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' != tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' < tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' < tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' < tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' < tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' < tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' < tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' < tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' < tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' < tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' < tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' < tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' < tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' < tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' < tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' < tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' < tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' <= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' <= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' <= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' <= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' <= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' <= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' <= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' <= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' <= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' <= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' <= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' <= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' <= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' <= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' <= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' <= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' > tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' > tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' > tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' > tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' > tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' > tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' > tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' > tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' > tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' > tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' > tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' > tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' > tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' > tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' > tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' > tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' >= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' >= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' >= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint 'Npoint(1, 0.5)@2000-01-01' >= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' >= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' >= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' >= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}' >= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' >= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' >= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' >= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]' >= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' >= tnpoint 'Npoint(1, 0.5)@2000-01-01';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' >= tnpoint '{Npoint(1, 0.3)@2000-01-01, Npoint(1, 0.5)@2000-01-02, Npoint(1, 0.5)@2000-01-03}';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' >= tnpoint '[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03]';
SELECT tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}' >= tnpoint '{[Npoint(1, 0.2)@2000-01-01, Npoint(1, 0.4)@2000-01-02, Npoint(1, 0.5)@2000-01-03], [Npoint(2, 0.6)@2000-01-04, Npoint(2, 0.6)@2000-01-05]}';

-------------------------------------------------------------------------------/
