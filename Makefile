SHARED=/usr/share/undvd
DOC=/usr/share/doc/undvd
BIN=/usr/bin

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
	ln -s ${SHARED}/encvid ${BIN_CHROOT}
	ln -s ${SHARED}/scandvd ${BIN_CHROOT}
	ln -s ${SHARED}/undvd ${BIN_CHROOT}
	ln -s ${SHARED}/vidstat ${BIN_CHROOT}
