#!/bin/bash
set -e  # 에러 발생 시 중단

rm -rf logs db
mkdir -p logs db
touch logs/calamitica.log


python manage.py makemigrations
python manage.py migrate

# superuser 자동 생성 with 확인 메시지
echo "🛠 Superuser 생성 시도..."

python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', '1111')
    print('✅ Superuser 생성 완료')
else:
    print('ℹ️ Superuser 이미 존재함')
"

echo "✅ 초기 설정 완료"
