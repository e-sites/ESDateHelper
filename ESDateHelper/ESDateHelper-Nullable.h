//
//  ESDateHelper-Nullable.h
//  ESDateHelper
//
//  Created by Bas van Kuijck on 30-07-15.
//  Copyright © 2015 e-sites. All rights reserved.
//

#ifndef ESDateHelper_Nullable_h
#define ESDateHelper_Nullable_h

/**
 *  @definedblock nullable / nonull helpers
 *
 *  @define ES_NULLABLE nullable (>= iOS9)
 *  @define ES_NOTNULLABLE nonnull (>= iOS9)
 *  @define ES_NULLABLE_PROPERTY nullable, (>= iOS9)
 *  @define ES_NOTNULLABLE_PROPERTY nonnull, (>= iOS9)
 *	@parseOnly
 */
#ifdef __IPHONE_9_0
#   define ES_NULLABLE nullable
#   define ES_NOTNULLABLE nonnull
#   define ES_NULLABLE_PROPERTY ES_NULLABLE,
#   define ES_NOTNULLABLE_PROPERTY ES_NOTNULLABLE,
#else
#   define ES_NULLABLE_PROPERTY
#   define ES_NOTNULLABLE_PROPERTY
#   define ES_NULLABLE
#   define ES_NOTNULLABLE
#endif
/*! @/definedblock */

#endif
