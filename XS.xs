/* --------------------- C CODE ---------------------- */
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <linux/version.h> /* LINUX_VERSION_CODE, KERNEL_VERSION */
#include <errno.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/types.h>
#ifdef __cplusplus
}
#endif

#ifndef __linux
#error "No linux. Compile aborted."
#endif

// PR_GET_NAME(over 2.6.11) PR_SET_NAME(over 2.6.9)
#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,9)
#error "Kernel version is under 2.6.9. Compile aborted."
#endif

#define PROG_NAME_LEN 16


/* --------------------- XS CODE ---------------------- */
MODULE = Linux::Prctl::XS  PACKAGE = Linux::Prctl::XS
PROTOTYPES: ENABLE

SV*
pr_get_name()
PREINIT:
	char buf[PROG_NAME_LEN] = "";
CODE:
	prctl(PR_GET_NAME, buf);
	RETVAL = newSVpvn(buf, strlen(buf));
OUTPUT:
	RETVAL

SV*
pr_set_name(SV* buf)
PREINIT:
    int ret;
CODE:
	if (SvCUR(buf) >= PROG_NAME_LEN) {
		PerlIO_printf(PerlIO_stderr(), "pr_set_name: name buffer is %i bytes over\n", PROG_NAME_LEN);
	}
	ret = prctl(PR_SET_NAME, SvPVX(buf));
    RETVAL = newSViv(ret == 0 ? 1 : 0);
OUTPUT:
    RETVAL
