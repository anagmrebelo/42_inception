from apscheduler.schedulers.background import BlockingScheduler
import shutil
import os
from datetime import date

def update_database_job():
    today = date.today().strftime('%Y-%m-%d')
    new_dst_dir = os.path.join(os.environ['BACKUP_MOUNT_DIR'], today)
    if os.path.exists(new_dst_dir):
        shutil.rmtree(new_dst_dir)
    shutil.copytree(os.environ['BBDD_MOUNT_DIR'], new_dst_dir)
    print(f"Backup done in {new_dst_dir} from {os.environ['BBDD_HOST_PATH']} on {date.today()}")

# First Backup ar start
update_database_job()
# Planner to backup daily
scheduler = BlockingScheduler()
scheduler.add_job(update_database_job, 'interval', days=1)
scheduler.start()
