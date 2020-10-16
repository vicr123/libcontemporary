/****************************************
 *
 *   INSERT-PROJECT-NAME-HERE - INSERT-GENERIC-NAME-HERE
 *   Copyright (C) 2020 Victor Tran
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * *************************************/
#include "tjobmanager.h"

#include "jobs/jobbutton.h"
#include "jobs/jobspopover.h"
#include "tpopover.h"

struct tJobManagerPrivate {
    QList<tJob*> jobs;
};

tJobManager::tJobManager(QObject* parent) : QObject(parent) {
    d = new tJobManagerPrivate();
}

tJobManager::~tJobManager() {
    delete d;
}

tJobManager* tJobManager::instance() {
    static tJobManager* instance = new tJobManager();
    return instance;
}

void tJobManager::trackJob(tJob* job) {
    instance()->d->jobs.append(job);
    emit instance()->jobAdded(job);
}

QList<tJob*> tJobManager::jobs() {
    return instance()->d->jobs;
}

QWidget* tJobManager::makeJobButton() {
    return new JobButton();
}

void tJobManager::showJobsPopover(QWidget* parent) {
    JobsPopover* jp = new JobsPopover();
    tPopover* popover = new tPopover(jp);
    popover->setPopoverWidth(SC_DPI(300));
    connect(jp, &JobsPopover::done, popover, &tPopover::dismiss);
    connect(popover, &tPopover::dismissed, popover, &tPopover::deleteLater);
    connect(popover, &tPopover::dismissed, jp, &JobsPopover::deleteLater);
    popover->show(parent->window());
}
