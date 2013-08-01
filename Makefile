SHARED=/share/undvd
DOC=/share/doc/undvd
BIN=/bin

ifndef DESTDIR
	DESTDIR=/usr
endif

SHARED_CHROOT=${DESTDIR}${SHARED}
DOC_CHROOT=${DESTDIR}${DOC}
BIN_CHROOT=${DESTDIR}${BIN}

all: clean

clean:
	-@true

install:
	mkdir -p ${SHARED_CHROOT}
	install -m644 colors.pm ${SHARED_CHROOT}
	install -m644 common.pm ${SHARED_CHROOT}
	install -m755 encvid ${SHARED_CHROOT}
	install -m755 scandvd ${SHARED_CHROOT}
	install -m755 undvd ${SHARED_CHROOT}
	install -m755 vidstat ${SHARED_CHROOT}
	mkdir -p ${SHARED_CHROOT}/test
	install -m755 test/codectest ${SHARED_CHROOT}/test

	mkdir -p ${DOC_CHROOT}
	install -m644 doc/userguide.html ${DOC_CHROOT}
	install -m644 doc/codectest.svg ${DOC_CHROOT}
	install -m644 doc/codectest.txt ${DOC_CHROOT}
	install -m644 doc/codectest_all.svg ${DOC_CHROOT}
	install -m644 doc/codectest_all.txt ${DOC_CHROOT}
	install -m644 Changelog ${DOC_CHROOT}

	mkdir -p ${BIN_CHROOT}
	ln -s ${SHARED_CHROOT}/encvid ${BIN_CHROOT}
	ln -s ${SHARED_CHROOT}/scandvd ${BIN_CHROOT}
	ln -s ${SHARED_CHROOT}/undvd ${BIN_CHROOT}
	ln -s ${SHARED_CHROOT}/vidstat ${BIN_CHROOT}

uninstall:
	rm -f -v -- ${SHARED_CHROOT}/colors.pm
	rm -f -v -- ${SHARED_CHROOT}/common.pm
	rm -f -v -- ${SHARED_CHROOT}/encvid
	rm -f -v -- ${SHARED_CHROOT}/scandvd
	rm -f -v -- ${SHARED_CHROOT}/undvd
	rm -f -v -- ${SHARED_CHROOT}/vidstat
	rm -f -v -- ${SHARED_CHROOT}/test/codectest
	- rmdir -v -- ${SHARED_CHROOT}/test
	- rmdir -v -- ${SHARED_CHROOT}

	rm -f -v -- ${DOC_CHROOT}/userguide.html
	rm -f -v -- ${DOC_CHROOT}/codectest.svg
	rm -f -v -- ${DOC_CHROOT}/codectest.txt
	rm -f -v -- ${DOC_CHROOT}/codectest_all.svg
	rm -f -v -- ${DOC_CHROOT}/codectest_all.txt
	rm -f -v -- ${DOC_CHROOT}/Changelog
	- rmdir -v -- ${DOC_CHROOT}

	rm -f -v -- ${BIN_CHROOT}/encvid
	rm -f -v -- ${BIN_CHROOT}/scandvd
	rm -f -v -- ${BIN_CHROOT}/undvd
	rm -f -v -- ${BIN_CHROOT}/vidstat
	- rmdir -v -- ${BIN_CHROOT}