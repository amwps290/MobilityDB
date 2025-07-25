/*****************************************************************************
 *
 * This MobilityDB code is provided under The PostgreSQL License.
 * Copyright (c) 2016-2025, Université libre de Bruxelles and MobilityDB
 * contributors
 *
 * MobilityDB includes portions of PostGIS version 3 source code released
 * under the GNU General Public License (GPLv2 or later).
 * Copyright (c) 2001-2025, PostGIS contributors
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without a written
 * agreement is hereby granted, provided that the above copyright notice and
 * this paragraph and the following two paragraphs appear in all copies.
 *
 * IN NO EVENT SHALL UNIVERSITE LIBRE DE BRUXELLES BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING
 * LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
 * EVEN IF UNIVERSITE LIBRE DE BRUXELLES HAS BEEN ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * UNIVERSITE LIBRE DE BRUXELLES SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON
 * AN "AS IS" BASIS, AND UNIVERSITE LIBRE DE BRUXELLES HAS NO OBLIGATIONS TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 *****************************************************************************/

/**
 * @file
 * @brief Temporal Boolean operators: and, or, not
 */

#include "temporal/tbool_ops.h"

/* C */
#include <assert.h>
/* MEOS */
#include <meos.h>
#include <meos_internal.h>
#include "temporal/lifting.h"

/*****************************************************************************
 * Boolean operations functions on datums
 *****************************************************************************/

/**
 * @brief Return the Boolean and of two values
 */
Datum
datum_and(Datum l, Datum r)
{
  return BoolGetDatum(DatumGetBool(l) && DatumGetBool(r));
}

/**
 * @brief Return the Boolean or of two values
 */
Datum
datum_or(Datum l, Datum r)
{
  return BoolGetDatum(DatumGetBool(l) || DatumGetBool(r));
}

/**
 * @brief Return the Boolean not of a value
 */
Datum
datum_not(Datum d)
{
  return BoolGetDatum(! DatumGetBool(d));
}

/*****************************************************************************
 * Generic functions
 *****************************************************************************/

/**
 * @ingroup meos_temporal_bool
 * @brief Return the boolean not of a temporal boolean
 * @param[in] temp Temporal value
 * @csqlfn #Tnot_tbool()
 */
Temporal *
tnot_tbool(const Temporal *temp)
{
  /* Ensure the validity of the arguments */
  VALIDATE_TBOOL(temp, NULL); 

  LiftedFunctionInfo lfinfo;
  memset(&lfinfo, 0, sizeof(LiftedFunctionInfo));
  lfinfo.func = (varfunc) &datum_not;
  lfinfo.numparam = 0;
  lfinfo.argtype[0] = T_TBOOL;
  lfinfo.restype = T_TBOOL;
  lfinfo.reslinear = false;
  lfinfo.invert = INVERT_NO;
  lfinfo.discont = CONTINUOUS;
  return tfunc_temporal(temp, &lfinfo);
}

/**
 * @brief Return the boolean operator of a temporal boolean and a boolean
 */
Temporal *
boolop_tbool_bool(const Temporal *temp, Datum b, datum_func2 func, bool invert)
{
  assert(temp); assert(temp->temptype == T_TBOOL);

  LiftedFunctionInfo lfinfo;
  memset(&lfinfo, 0, sizeof(LiftedFunctionInfo));
  lfinfo.func = (varfunc) func;
  lfinfo.argtype[0] = T_TBOOL;
  lfinfo.argtype[1] = T_BOOL;
  lfinfo.restype = T_TBOOL;
  lfinfo.reslinear = false;
  lfinfo.invert = invert;
  lfinfo.discont = CONTINUOUS;
  return tfunc_temporal_base(temp, b, &lfinfo);
}

/**
 * @brief Return the boolean operator of two temporal booleans
 */
Temporal *
boolop_tbool_tbool(const Temporal *temp1, const Temporal *temp2,
  datum_func2 func)
{
  assert(temp1); assert(temp2);
  assert(temp1->temptype == temp2->temptype);
  assert(temp1->temptype == T_TBOOL);
  LiftedFunctionInfo lfinfo;
  memset(&lfinfo, 0, sizeof(LiftedFunctionInfo));
  lfinfo.func = (varfunc) func;
  lfinfo.argtype[0] = lfinfo.argtype[1] = T_TBOOL;
  lfinfo.restype = T_TBOOL;
  lfinfo.reslinear = false;
  lfinfo.invert = INVERT_NO;
  lfinfo.discont = CONTINUOUS;
  return tfunc_temporal_temporal(temp1, temp2, &lfinfo);
}

/*****************************************************************************/

/**
 * @ingroup meos_temporal_bool
 * @brief Return the time when the temporal boolean has value true
 * @param[in] temp Temporal value
 * @csqlfn #Tbool_when_true()
 */
SpanSet *
tbool_when_true(const Temporal *temp)
{
  /* Ensure the validity of the arguments */
  VALIDATE_TBOOL(temp, NULL);
  Temporal *temp1 = temporal_restrict_value(temp, BoolGetDatum(true), REST_AT);
  if (! temp1)
    return NULL;
  SpanSet *result = temporal_time(temp1);
  pfree(temp1);
  return result;
}

/*****************************************************************************/
